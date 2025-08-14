// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/styles/assets.dart';
import '../../common/styles/theme.dart';
import '../../common/utils/board_widgets_utils.dart';
import '../../common/utils/time_utils.dart';
import '../../core/dependencies/dependencies.dart';
import '../../models/boards_tab_model.dart';
import '../../models/device_model.dart';
import '../boards/daily_sob/notifier/dailys_sob_notifier.dart';
import '../login/notifier/login_notifier.dart';

class LastReadingsWidget extends ConsumerStatefulWidget {
  final BoardsChartWidgetModel model;
  LastReadingsWidget(this.model, {super.key});
  @override
  ConsumerState<LastReadingsWidget> createState() => _LastReadingsWidgetState();
}

class _LastReadingsWidgetState extends ConsumerState<LastReadingsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LastReadingsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lastReadingsWidgetModel = ref
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
          width: (lastReadingsWidgetModel.width == 0 ? 400 : lastReadingsWidgetModel.width ?? 400).toDouble() - 8,
          height: (lastReadingsWidgetModel.height == 0 ? 200 : lastReadingsWidgetModel.height ?? 200).toDouble() - 8,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Color(int.parse(lastReadingsWidgetModel.backgroundColor ?? "FFFF0000", radix: 16)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              Visibility(
                visible: lastReadingsWidgetModel.isShowConnectedStatus ?? false,
                child: Positioned(
                  right: 10,
                  top: 10,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Color(int.parse(lastReadingsWidgetModel.fontColor ?? "FFFFFFFF", radix: 16)),
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset(
                      AssetsImages.lightningBoltIconRemovebgPreview_2Svg,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        lastReadingsWidgetModel.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (lastReadingsWidgetModel.fontSize == null || lastReadingsWidgetModel.fontSize == 0)
                              ? 16
                              : lastReadingsWidgetModel.fontSize?.sp,
                          color: Color(
                            int.parse(lastReadingsWidgetModel.fontColor ?? "FFFFFFFF", radix: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return ref.watch(getLastReadingsWidgetStatusProvider(lastReadingsWidgetModel)).when(
                        data: (deviceEnergyResponseEntity) {
                          String status =
                              getLastReadingsWidgetStatusValue(lastReadingsWidgetModel, deviceEnergyResponseEntity);
                          return Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    status,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: ((lastReadingsWidgetModel.fontSize == null ||
                                                  lastReadingsWidgetModel.fontSize == 0)
                                              ? 30
                                              : (lastReadingsWidgetModel.fontSize ?? 22) + 12)
                                          .sp,
                                      color:
                                          Color(int.parse(lastReadingsWidgetModel.fontColor ?? "FFFFFFFF", radix: 16)),
                                    ),
                                  ),
                                  Text(
                                    //字符串时间戳转换 try catch
                                    getTimeEEEEMMMMDDYHHMMSSInt(getLastReadingsWidgetStatusTime(
                                        lastReadingsWidgetModel, deviceEnergyResponseEntity)),
                                    // lastReadingsWidgetModel.createdAt ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: (lastReadingsWidgetModel.fontSize == null ||
                                              lastReadingsWidgetModel.fontSize == 0)
                                          ? 16
                                          : lastReadingsWidgetModel.fontSize?.sp,
                                      color:
                                          Color(int.parse(lastReadingsWidgetModel.fontColor ?? "FFFFFFFF", radix: 16)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        error: (Object error, StackTrace stackTrace) {
                          return Text(
                            "N/A",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize:
                                  ((lastReadingsWidgetModel.fontSize == null || lastReadingsWidgetModel.fontSize == 0)
                                          ? 16
                                          : lastReadingsWidgetModel.fontSize ?? 0 + 10)
                                      .sp,
                              color: Color(int.parse(lastReadingsWidgetModel.fontColor ?? "FFFFFFFF", radix: 16)),
                            ),
                          );
                        },
                        loading: () {
                          return Container();
                        },
                      );
                    },
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        lastReadingsWidgetModel.description ??
                            ref
                                .read(itemsDeviceModelProvider)
                                .firstWhere((element) => element.id == lastReadingsWidgetModel.deviceId,
                                    orElse: () => DeviceModel(name: ""))
                                .name ??
                            "N/A",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (lastReadingsWidgetModel.fontSize == null || lastReadingsWidgetModel.fontSize == 0)
                              ? 16
                              : lastReadingsWidgetModel.fontSize?.sp,
                          color: Color(
                            int.parse(lastReadingsWidgetModel.fontColor ?? "FFFFFFFF", radix: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                              ref.read(selectedWidgetProvider.notifier).state = lastReadingsWidgetModel;
                            } else if (ref.watch(floatButtonProvider) == "BoardsViewDelete") {
                              //删除
                              bool result = await ref
                                  .read(deleteBoardsWidgetProvider.notifier)
                                  .deleteBoardsWidget(lastReadingsWidgetModel.id, ref.read(loginProvider).data?.token);
                              if (result) {
                                ref.refresh(getBoardsWidgetsProvider(lastReadingsWidgetModel.boardId ?? 0));
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
