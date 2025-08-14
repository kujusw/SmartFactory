// ignore_for_file: unused_result

import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/logger_manager.dart';
import '../../http/boardstab.dart';
import '../../models/boards_tab_model.dart';
import '../boards/daily_sob/notifier/dailys_sob_notifier.dart';
import '../login/notifier/login_notifier.dart';
import 'chartwidget.dart';
import 'lastreadingswidget.dart';

class DraggableBoard extends ConsumerStatefulWidget {
  DraggableBoard();
  @override
  _DraggableBoardState createState() => _DraggableBoardState();
}

class _DraggableBoardState extends ConsumerState<DraggableBoard> {
  final List<GlobalKey<_PositionedItemState>> itemKeys = [];
  List<Widget> items = [];
  BoardsTabModel? tab;
  Timer? _saveTimer; // 用于延迟保存的计时器

  @override
  void dispose() {
    super.dispose();
    _saveTimer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize items list and add keys after the first frame
      final indexBoards = ref.watch(indexBoardsProvider);
      final page = ref.watch(pageProvider);
      //小心删除时刷新越界
      if (indexBoards >= page.length) {
        tab = page[0];
      } else {
        tab = page[indexBoards];
      }
      ref.refresh(getBoardsWidgetsProvider(tab?.id ?? 0)); //刷新并read新值
    });
  }

  void _scheduleSave() {
    _saveTimer?.cancel(); // 取消之前的计时器
    _saveTimer = Timer(Duration(milliseconds: 500), _saveOffsets); // 延迟1秒执行保存
  }

  Future<void> _saveOffsets() async {
    final offsets = itemKeys
        .map((key) {
          final state = key.currentState;
          if (state != null) {
            // 仅保存已稳定的 items
            return {'id': state.widget.model.id, 'offset': state.offset};
          }
          return null;
        })
        .where((element) => element != null)
        .toList();

    // 调用你的 API 保存数据
    try {
      final token = ref.read(loginProvider).data?.token;
      if (token == null) {
        return;
      }
      int boardId = tab?.id ?? 0;
      final boardsWidgetOffsets = offsets.map((e) {
        return BoardsWidget(
          id: e!['id'] == null ? 0 : int.parse(e['id'].toString()),
          position_x: (e['offset'] as Offset).dx.toInt(),
          position_y: (e['offset'] as Offset).dy.toInt(),
        );
      }).toList();
      BoardsWidgetOffsetRequestEntity params = BoardsWidgetOffsetRequestEntity(widgets: boardsWidgetOffsets);
      if (boardsWidgetOffsets.isEmpty) {
        return;
      }
      await BoardsTabAPI.editBoardsWidgetOffset(params: params, boardId: boardId, token: token);
      //更新 BoardsChartWidgetModel 的 position_x 和 position_y
      for (var i = 0; i < boardsWidgetOffsets.length; i++) {
        //遍历  ref.read(chartWidgetsProvider 列表 找到 boardsWidgetOffsets[i].id == model.id 的 model position_x 和 position_y 不同才更新 model
        for (var j = 0; j < ref.read(chartWidgetsProvider).length; j++) {
          if (boardsWidgetOffsets[i].id == ref.read(chartWidgetsProvider)[j].id) {
            if (boardsWidgetOffsets[i].position_x != ref.read(chartWidgetsProvider)[j].position_x ||
                boardsWidgetOffsets[i].position_y != ref.read(chartWidgetsProvider)[j].position_y) {
              ref.read(chartWidgetsProvider.notifier).updateChartWidgetXY(
                    boardsWidgetOffsets[i].id,
                    boardsWidgetOffsets[i].position_x,
                    boardsWidgetOffsets[i].position_y,
                  );
            }
          }
        }
      }
    } catch (e) {
      // 如果发生错误
      LoggerManager().e("Error saving offsets: $e");
    }
  }

  // Function to check for overlapping and adjust items
  void adjustItems(List<PositionedItem> items) {
    for (int i = 0; i < items.length; i++) {
      for (int j = i + 1; j < items.length; j++) {
        if (isOverlappinInit(items[i], items[j])) {
          // Move item j below item i
          double newY = items[i].initialOffset.dy + items[i].height;
          items[j].initialOffset = Offset(items[j].initialOffset.dx, newY);
        }
      }
    }
    _scheduleSave(); // 在调整完成后保存 offsets
  }

  // Function to check if two items overlap
  bool isOverlappinInit(PositionedItem item1, PositionedItem item2) {
    return !(item1.initialOffset.dx >= item2.initialOffset.dx + item2.width ||
        item1.initialOffset.dx + item1.width <= item2.initialOffset.dx ||
        item1.initialOffset.dy >= item2.initialOffset.dy + item2.height ||
        item1.initialOffset.dy + item1.height <= item2.initialOffset.dy);
  }

  void adjustOverlappingItems(Key draggedKey, Offset draggedOffset, double draggedWidth, double draggedHeight) {
    for (var key in itemKeys) {
      if (key.currentState != null && key.currentWidget?.key != draggedKey) {
        Offset currentOffset = key.currentState!.offset;
        if (isOverlapping(draggedOffset, draggedWidth, draggedHeight, currentOffset, key.currentState!.widget.width,
            key.currentState!.widget.height)) {
          Offset newOffset = Offset(currentOffset.dx, draggedOffset.dy + draggedHeight);
          key.currentState!.updateOffset(newOffset);
          key.currentState!.widget.initialOffset = newOffset;
          // 递归调整受影响的项目
          adjustOverlappingItems(
              key.currentWidget!.key!, newOffset, key.currentState!.widget.width, key.currentState!.widget.height);
        }
      }
    }
    // 递归调整后，尝试向上移动项目
    moveUpIfPossible();
    _scheduleSave(); // 在调整完成后保存 offsets
  }

  void moveUpIfPossible() {
    // 创建一个新的列表，存储需要调整位置的 items
    List<_PositionedItemState> itemsToMoveUp =
        List.from(itemKeys.map((key) => key.currentState).where((state) => state != null));

    // 对所有需要调整的 items 按初始 offset 的 y 坐标进行排序，确保从上往下调整
    itemsToMoveUp.sort((a, b) => a.widget.initialOffset.dy.compareTo(b.widget.initialOffset.dy));

    // 调整每个 item 的位置
    for (var state in itemsToMoveUp) {
      Offset currentOffset = state.offset;
      double currentHeight = state.widget.height;
      Offset targetOffset = currentOffset;
      // 从 initialOffset 向上检查是否有空位
      while (targetOffset.dy > 0) {
        Offset newOffset = Offset(targetOffset.dx, max(targetOffset.dy - 100, 0));
        // 检查 newOffset 是否遮挡任何其他 widget
        if (!isAnyItemOverlapping(newOffset, state.widget.width, currentHeight, state)) {
          targetOffset = newOffset;
        } else {
          break;
        }
      }

      // 如果 targetOffset 和 currentOffset 不同，则更新位置
      if (targetOffset != currentOffset) {
        state.updateOffset(targetOffset);
        state.widget.initialOffset = targetOffset;
        // 递归调整受影响的项目
        adjustOverlappingItems(state.widget.key!, targetOffset, state.widget.width, state.widget.height);
      }
    }
    _scheduleSave(); // 在调整完成后保存 offsets
  }

  bool isAnyItemOverlapping(Offset offset, double width, double height, _PositionedItemState currentState) {
    for (var key in itemKeys) {
      if (key.currentState != null && key.currentState != currentState) {
        Offset itemInitialOffset = key.currentState!.widget.initialOffset;
        double itemWidth = key.currentState!.widget.width;
        double itemHeight = key.currentState!.widget.height;
        if (isOverlapping(offset, width, height, itemInitialOffset, itemWidth, itemHeight)) {
          return true;
        }
      }
    }
    return false;
  }

  bool isOverlapping(Offset offset1, double width1, double height1, Offset offset2, double width2, double height2) {
    return !(offset1.dx >= offset2.dx + width2 ||
        offset1.dx + width1 <= offset2.dx ||
        offset1.dy >= offset2.dy + height2 ||
        offset1.dy + height1 <= offset2.dy);
  }

  @override
  Widget build(BuildContext context) {
    final List<BoardsChartWidgetModel> widgets =
        ref.watch(chartWidgetsProvider).where((t) => t.boardId == tab?.id).toList();
    items = [
      // CustomPaint(
      //   size: Size(10000, 10000),
      //   painter: GridPainter(),
      // ),
      ...widgets.map((widgetModel) {
        return PositionedItem(
          name: widgetModel.type,
          key: GlobalKey<_PositionedItemState>(),
          initialOffset: Offset((widgetModel.position_x ?? 0.0).toDouble(), (widgetModel.position_y ?? 0.0).toDouble()),
          width: (widgetModel.width?.toDouble()) ??
              (widgetModel.type == "last_readings"
                  ? 400
                  : widgetModel.type == "chart"
                      ? 600
                      : 400),
          height: (widgetModel.height?.toDouble()) ??
              (widgetModel.type == "last_readings"
                  ? 200
                  : widgetModel.type == "chart"
                      ? 300
                      : 200),
          model: widgetModel,
          onPositionChanged: (newOffset) {
            // 每次位置改变时调用保存函数
            _scheduleSave();
          },
        );
      }).toList(),
    ];
    adjustItems(items.whereType<PositionedItem>().toList());
    // Add keys to itemKeys list
    itemKeys.addAll(items.whereType<PositionedItem>().map((item) => item.key as GlobalKey<_PositionedItemState>));
    ScrollController horizontalController = ScrollController();
    return Scrollbar(
      controller: horizontalController, // 为水平滚动视图提供控制器
      thumbVisibility: true,
      trackVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: horizontalController, // 使用水平控制器
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                },
              ),
              child: Container(
                width: 10000,
                height: 10000, // Large height to allow vertical scrolling
                child: Stack(
                  children: items,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PositionedItem extends ConsumerStatefulWidget {
  Offset initialOffset;
  final double width;
  final double height;
  final String? name;
  final Function(Offset)? onDragEnd;
  final Function(Offset)? onPositionChanged; // 新增的回调函数
  BoardsChartWidgetModel model;

  PositionedItem({
    Key? key,
    required this.name,
    required this.initialOffset,
    required this.width,
    required this.height,
    this.onDragEnd,
    this.onPositionChanged, // 新增的回调函数
    required this.model,
  }) : super(key: key);

  @override
  _PositionedItemState createState() => _PositionedItemState();
}

class _PositionedItemState extends ConsumerState<PositionedItem> {
  late Offset offset;
  Offset dragOffset = Offset.zero;
  @override
  void initState() {
    super.initState();
    offset = widget.initialOffset;
  }

  @override
  void didUpdateWidget(covariant PositionedItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialOffset != widget.initialOffset) {
      offset = widget.initialOffset;
    }
  }

  Offset _alignToGrid(Offset offset) {
    double gridSize = 100.0;
    double alignedX = (offset.dx % gridSize < gridSize / 2)
        ? (offset.dx / gridSize).floor() * gridSize
        : (offset.dx / gridSize).ceil() * gridSize;
    double alignedY = (offset.dy % gridSize < gridSize / 2)
        ? (offset.dy / gridSize).floor() * gridSize
        : (offset.dy / gridSize).ceil() * gridSize;
    return Offset(alignedX, alignedY);
  }

  Offset _constrainToBounds(Offset offset, double width, double height) {
    double constrainedX = offset.dx < 0 ? 0 : offset.dx;
    double constrainedY = offset.dy < 0 ? 0 : offset.dy;
    return Offset(constrainedX, constrainedY);
  }

  void updateOffset(Offset newOffset) {
    setState(() {
      offset = _alignToGrid(newOffset);
      if (widget.onPositionChanged != null) {
        widget.onPositionChanged!(offset); // 触发回调
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        feedback: Material(
          color: Colors.transparent,
          child: Container(
            width: widget.width,
            height: widget.height,
            color: Colors.blue.withValues(alpha: 0.5),
          ),
        ),
        childWhenDragging: Container(
          width: widget.width,
          height: widget.height,
          color: Colors.grey,
        ),
        onDragUpdate: (details) {
          setState(() {
            dragOffset = details.localPosition;
          });
        },
        onDragEnd: (details) {
          final renderBox = context.findRenderObject() as RenderBox;
          final localOffset = renderBox.globalToLocal(details.offset);
          Offset newOffset = Offset(
            localOffset.dx + offset.dx,
            localOffset.dy + offset.dy,
          );
          newOffset = _constrainToBounds(newOffset, widget.width, widget.height);
          setState(() {
            offset = _alignToGrid(newOffset);
            widget.initialOffset = offset;
            if (widget.onDragEnd != null) {
              widget.onDragEnd!(offset);
            }
          });
          // 调整重叠的 widgets
          (context.findAncestorStateOfType<_DraggableBoardState>() as _DraggableBoardState)
              .adjustOverlappingItems(widget.key!, offset, widget.width, widget.height);
        },
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    if (widget.model.type == "last_readings") {
      return LastReadingsWidget(widget.model);
    } else if (widget.model.type == "chart") {
      return ChartWidget(widget.model);
    }
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.red,
      child: Center(child: Text("No widget found")),
    );
  }
}

// class GridPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double gridSize = 100.0;
//     Paint paint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke;

//     for (double x = 0; x < size.width; x += gridSize) {
//       for (double y = 0; y < size.height; y += gridSize) {
//         canvas.drawRect(Rect.fromLTWH(x, y, gridSize, gridSize), paint);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
