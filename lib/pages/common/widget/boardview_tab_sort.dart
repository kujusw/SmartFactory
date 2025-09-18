import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../common/values/constant.dart';
import '../../../http/boardstab.dart';
import '../../../models/boards_tab_model.dart';
import '../../boards/daily_sob/notifier/dailys_sob_notifier.dart';
import '../../login/notifier/login_notifier.dart';

class BoardviewTabSortView extends ConsumerStatefulWidget {
  BoardviewTabSortView({super.key});
  @override
  ConsumerState<BoardviewTabSortView> createState() => _BoardviewTabSortViewState();
}

class _BoardviewTabSortViewState extends ConsumerState<BoardviewTabSortView> {
  List<BoardsTabModel>? list;
  // 用于存储每个项目的索引
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        list = ref
            .read(pageProvider)
            .where((e) => e.name != "General") // 过滤掉名称为 "General" 的项
            .map((e) => e)
            .toList();
        LoggerManager().d("BoardviewTabSortView initState list $list");
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _updateTabOrder() async {
    List<int>? boardIds = list?.map((item) => item.id ?? 0).toList();
    LoggerManager().d("boardIds: $boardIds");
    BoardsTabWidgetSortRequestEntity params = BoardsTabWidgetSortRequestEntity(boardIds: boardIds);
    try {
      await BoardsTabAPI.editBoardsTabWidgetSort(params: params, token: ref.read(loginProvider).data?.token);
      return true;
    } catch (e) {
      // 处理异常
      LoggerManager().e("Error updating board tab widget sort: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.w,
      height: 1080.h,
      color: ref.watch(colorProvider)['backgroundColorRightAction'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tab Sort",
                  style: TextStyle(
                    fontSize: Constant.textSP_18,
                    color: ref.watch(colorProvider)['white'],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    unawaited(SmartDialog.dismiss(tag: "BoardviewTabSortView"));
                  },
                  color: ref.watch(colorProvider)['white'],
                ),
              ],
            ),
          ),
          Container(
            height: 940.h,
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: ReorderableListView(
              // 数据列表
              children: list == null
                  ? []
                  : list!
                      .asMap()
                      .map((index, model) => MapEntry(
                            index,
                            BoardviewTabSortItem(
                              key: ValueKey(list![index].id),
                              model: model,
                              ref: ref, // 用实际的 WidgetRef 实现替换
                            ),
                          ))
                      .values
                      .toList(),
              // 拖拽回调函数
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  // 调整索引以防止越界错误
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  // 移动项目
                  final BoardsTabModel item = list!.removeAt(oldIndex);
                  list?.insert(newIndex, item);
                  LoggerManager().d("BoardviewTabSortView onReorder list $list");
                });
              },
            ),
          ),
          Container(
            color: ref.watch(colorProvider)['backgroundColorWidget'],
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    unawaited(SmartDialog.dismiss(tag: "BoardviewTabSortView"));
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: Constant.textSP_18,
                      color: ref.watch(colorProvider)['grey'],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    // 发起网络请求
                    bool result = await _updateTabOrder();
                    if (result) {
                      ref.read(pageProvider.notifier).clearTabs();
                      ref.read(pageProvider.notifier).addTabs(list!);
                      unawaited(SmartDialog.dismiss(tag: "BoardviewTabSortView"));
                    }
                  },
                  style: ButtonStyle(
                    overlayColor:
                        WidgetStateProperty.all(ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                    backgroundColor: WidgetStateProperty.all<Color>(ref.watch(colorProvider)['main']!),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: Constant.textSP_18,
                      color: ref.watch(colorProvider)['white'],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoardviewTabSortItem extends StatelessWidget {
  final BoardsTabModel model;
  final WidgetRef ref;

  const BoardviewTabSortItem({
    Key? key,
    required this.ref,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(model.id),
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: ref.watch(colorProvider)['backgroundColorWidget'],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Text(
            model.name ?? "", //单行显示,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: Constant.textSP_16,
              color: ref.watch(colorProvider)['text'],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
