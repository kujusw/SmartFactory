// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../common/styles/theme.dart';
import '../../common/values/index.dart';
import '../../core/dependencies/dependencies.dart';
import '../../models/boards_tab_model.dart';
import '../../models/device_model.dart';
import '../boards/daily_sob/notifier/dailys_sob_notifier.dart';
import '../login/notifier/login_notifier.dart';
import 'barchart.dart';

class ChartWidget extends ConsumerStatefulWidget {
  final BoardsChartWidgetModel model;
  ChartWidget(this.model, {super.key});
  @override
  ConsumerState<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends ConsumerState<ChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ChartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartWidgetModel = ref
        .watch(chartWidgetsProvider)
        .firstWhere((model) => model.id == widget.model.id, orElse: () => BoardsChartWidgetModel());
    return MouseRegion(
      onEnter: (PointerEvent details) => () {
        // 鼠标悬停时的背景色
      },
      onExit: (PointerEvent details) => () {
        // 鼠标离开时的背景色
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: (chartWidgetModel.width == 0 ? 600 : chartWidgetModel.width ?? 600).toDouble() - 8,
          height: (chartWidgetModel.height == 0 ? 300 : chartWidgetModel.height ?? 300).toDouble() - 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(int.parse(chartWidgetModel.backgroundColor ?? "FFFF0000", radix: 16)),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: 40,
                  width: (chartWidgetModel.width == 0 ? 600 : chartWidgetModel.width ?? 600).toDouble(),
                  alignment: Alignment.center,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Consumer(
                        builder: (contextConsumer, ref, child) {
                          return Text(
                            ref.watch(itemsDeviceModelProvider).firstWhere(
                                  (element) => element.id == chartWidgetModel.deviceId,
                                  orElse: () {
                                    return DeviceModel(name: "");
                                  },
                                ).name ??
                                "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Constant.textSP_16,
                              color: Color(int.parse(chartWidgetModel.backgroundColor ?? "FFFFFFFF", radix: 16)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    height: 40,
                    width: (chartWidgetModel.width ?? 600).toDouble(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                      color: Color(int.parse(chartWidgetModel.backgroundColor ?? "FFFF0000", radix: 16)),
                    ),
                    child: Text(
                      textAlign: TextAlign.start,
                      chartWidgetModel.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Constant.textSP_20,
                        color: Color(int.parse(chartWidgetModel.fontColor ?? "FFFFFFFF", radix: 16)),
                      ),
                    ),
                  ),
                  // chartWidgetModel.type == "Line" ? LineChartWidget() : BarChartWidget(chartWidgetModel),
                  BarChartWidget(chartWidgetModel),
                ],
              ),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  return Visibility(
                    visible: ref.watch(floatButtonProvider) == "BoardsViewDelete" ||
                        ref.watch(floatButtonProvider) == "BoardsViewEdit",
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          padding: EdgeInsets.only(right: 10),
                          icon: ref.watch(floatButtonProvider) == "BoardsViewDelete"
                              ? Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.edit,
                                  color: Colors.red,
                                ),
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                            overlayColor: WidgetStateProperty.all(
                                ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                          ),
                          onPressed: () async {
                            if (ref.watch(floatButtonProvider) == "BoardsViewEdit") {
                              //编辑
                              ref.read(selectedWidgetProvider.notifier).state = chartWidgetModel;
                            } else if (ref.watch(floatButtonProvider) == "BoardsViewDelete") {
                              //删除
                              bool result = await ref
                                  .read(deleteBoardsWidgetProvider.notifier)
                                  .deleteBoardsWidget(chartWidgetModel.id, ref.read(loginProvider).data?.token);
                              if (result) {
                                ref.refresh(getBoardsWidgetsProvider(chartWidgetModel.boardId ?? 0));
                              } else {
                                unawaited(SmartDialog.showToast("Delete failed"));
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
