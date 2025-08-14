import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../../common/styles/theme.dart';
import '../../../common/utils/board_widgets_utils.dart';
import '../../../common/utils/screenutil.dart';
import '../../../common/values/index.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../models/boards_tab_model.dart';
import '../../../models/device_model.dart';
import '../../../models/test_data_provider.dart';
import '../../common/chartwidgettemplate.dart';

import '../../common/customtitletextfield.dart';
import '../../login/notifier/login_notifier.dart';
import 'customdropdown.dart';
import 'notifier/dailys_sob_notifier.dart';

class AddChartWidgetView extends ConsumerStatefulWidget {
  final BoardsChartWidgetModel? model;
  AddChartWidgetView(this.model, {super.key});
  @override
  ConsumerState<AddChartWidgetView> createState() => _AddChartWidgetViewState();
}

class _AddChartWidgetViewState extends ConsumerState<AddChartWidgetView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // LoggerManager().d("AddChartWidgetView ${widget.model}");
      ref.read(widgetTitleProvider.notifier).state = widget.model?.title ?? "";
      ref.read(thingProvider.notifier).state = ref
              .read(itemsDeviceModelProvider)
              .firstWhere((element) => element.id == widget.model?.deviceId, orElse: () => DeviceModel(name: ""))
              .name ??
          "";
      ref.read(widgetReadingProvider.notifier).state = getReadingByBoardsChartWidgetModelInChart(widget.model);

      ref.read(chartTypeProvider.notifier).state = widget.model?.chartType == "line" ? "Line" : "Bar";
      ref.read(widgetBackgroundColorProvider.notifier).state =
          Color(int.parse(widget.model?.backgroundColor ?? "FFFF0000", radix: 16));
      ref.read(widgetFontColorProvider.notifier).state =
          Color(int.parse(widget.model?.fontColor ?? "FFFFFFFF", radix: 16));
      ref.read(widgetIsShowConnectedStatusProvider.notifier).state = widget.model?.isShowConnectedStatus ?? false;
      ref.read(chartWidgetWidthProvider.notifier).state = widget.model?.width ?? 600;
      ref.read(chartWidgetHeightProvider.notifier).state = widget.model?.height ?? 300;

      if (widget.model?.width == 600 && widget.model?.height == 300) {
        ref.read(sizeNotifierProvider.notifier).selectSize(SizeOption.small);
      } else if (widget.model?.width == 800 && widget.model?.height == 500) {
        ref.read(sizeNotifierProvider.notifier).selectSize(SizeOption.medium);
      } else if (widget.model?.width == 1000 && widget.model?.height == 700) {
        ref.read(sizeNotifierProvider.notifier).selectSize(SizeOption.large);
      } else {
        ref.read(sizeNotifierProvider.notifier).selectSize(SizeOption.small);
      }
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

  @override
  Widget build(BuildContext context) {
    final sizeState = ref.watch(sizeNotifierProvider);
    final sizeNotifier = ref.read(sizeNotifierProvider.notifier);
    return Container(
      width: 1920.w,
      height: 1080.h,
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            width: 1320.w,
            height: 1080.h,
            child: Center(
              child: ChartWidgetTemplate(),
            ),
          ),
          Container(
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
                        "Configure Widget - Chart",
                        style: TextStyle(
                          fontSize: Constant.textSP_18,
                          color: ref.watch(colorProvider)['white'],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          //清除选中的widget
                          ref.read(selectedWidgetProvider.notifier).state = null;
                          unawaited(SmartDialog.dismiss(tag: "AddChartWidget"));
                        },
                        color: ref.watch(colorProvider)['white'],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 940.h,
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTitleTextField(
                          title: 'Title',
                          hintText: 'Enter Title',
                          initialValue: ref.read(widgetTitleProvider),
                          onChanged: (value) {
                            ref.read(widgetTitleProvider.notifier).state = value;
                          },
                        ),
                        CustomDropdown(
                          title: "Device",
                          value: ref.watch(thingProvider),
                          list: ref.read(itemsDeviceModelProvider).map((e) => e.name ?? "").toList(),
                          onSelected: (value) {
                            // Handle the selected value here
                            ref.read(thingProvider.notifier).state = value ?? "";
                            unawaited(SmartDialog.dismiss(tag: "SelectPopupPage"));
                          },
                        ),

                        CustomDropdown(
                          title: "Reading",
                          value: ref.watch(widgetReadingProvider),
                          list: getReadingsInChart,
                          onSelected: (value) {
                            ref.read(widgetReadingProvider.notifier).state = value ?? "Hourly Usage(Last 7 Days)";
                            unawaited(SmartDialog.dismiss(tag: "SelectPopupPage"));
                          },
                        ),

                        CustomDropdown(
                          title: "Chart Type",
                          value: ref.watch(chartTypeProvider),
                          // list: const ["Line", "Bar"],
                          list: const ["Bar"],
                          onSelected: (value) {
                            // Handle the selected value here
                            ref.read(chartTypeProvider.notifier).state = value ?? "Bar";
                            unawaited(SmartDialog.dismiss(tag: "SelectPopupPage"));
                          },
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Text(
                            "Background Color",
                            style: TextStyle(
                              fontSize: Constant.textSP_18,
                              color: ref.watch(colorProvider)['text'],
                            ),
                          ),
                        ),
                        Container(
                          height: 80.h,
                          width: 300.h,
                          padding: EdgeInsets.only(top: 10.h),
                          child: ScrollConfiguration(
                            behavior: const MaterialScrollBehavior()
                                .copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
                            child: CustomScrollView(
                              //禁用滚动
                              physics: NeverScrollableScrollPhysics(),
                              slivers: [
                                SliverGrid(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 8, // 每行三个项目
                                    mainAxisSpacing: 5.h, // 主轴方向的间距
                                    crossAxisSpacing: 5.h, // 交叉轴方向的间距
                                  ),
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      var color = TestDataProvider.getWidgetBackgroundColorColorslListTest()[index];
                                      return GestureDetector(
                                        onTap: () {
                                          ref.read(widgetBackgroundColorProvider.notifier).state = color;
                                        },
                                        child: Container(
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.h),
                                            color: color,
                                          ),
                                        ),
                                      );
                                    },
                                    childCount: TestDataProvider.getWidgetBackgroundColorColorslListTest().length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Text(
                            "Text Color",
                            style: TextStyle(
                              fontSize: Constant.textSP_18,
                              color: ref.watch(colorProvider)['text'],
                            ),
                          ),
                        ),
                        //两种颜色选择 白黑
                        Container(
                          height: 75.h,
                          width: 75.h,
                          padding: EdgeInsets.only(top: 10.h),
                          child: ScrollConfiguration(
                            behavior: const MaterialScrollBehavior()
                                .copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
                            child: CustomScrollView(
                              //禁用滚动
                              physics: NeverScrollableScrollPhysics(),
                              slivers: [
                                SliverGrid(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // 每行三个项目
                                    crossAxisSpacing: 10.h, // 交叉轴方向的间距
                                  ),
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      var color = TestDataProvider.getFontColorListTest()[index];
                                      return GestureDetector(
                                        onTap: () {
                                          ref.read(widgetFontColorProvider.notifier).state = color;
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.h),
                                                shape: BoxShape.rectangle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.green,
                                                    blurRadius: 1,
                                                  ),
                                                ],
                                                color: color,
                                              ),
                                            ),
                                            Align(
                                              child: Icon(
                                                Icons.check,
                                                color: ref.watch(widgetFontColorProvider) == Colors.white
                                                    ? Colors.black
                                                    : Colors.white,
                                                size: 20.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    childCount: TestDataProvider.getFontColorListTest().length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "Size",
                          style: TextStyle(
                            fontSize: Constant.textSP_18,
                            color: ref.watch(colorProvider)['text'],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RadioListTile<SizeOption>(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  'Small',
                                  style: TextStyle(
                                    fontSize: Constant.textSP_18,
                                    color: ref.watch(colorProvider)['text'],
                                  ),
                                ),
                                value: SizeOption.small,
                                groupValue: sizeState.selectedSize,
                                onChanged: (size) {
                                  sizeNotifier.selectSize(size!);
                                  ref.read(chartWidgetWidthProvider.notifier).state = 600;
                                  ref.read(chartWidgetHeightProvider.notifier).state = 300;
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<SizeOption>(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  'Medium',
                                  style: TextStyle(
                                    fontSize: Constant.textSP_18,
                                    color: ref.watch(colorProvider)['text'],
                                  ),
                                ),
                                value: SizeOption.medium,
                                groupValue: sizeState.selectedSize,
                                onChanged: (size) {
                                  sizeNotifier.selectSize(size!);
                                  ref.read(chartWidgetWidthProvider.notifier).state = 800;
                                  ref.read(chartWidgetHeightProvider.notifier).state = 500;
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<SizeOption>(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  'Large',
                                  style: TextStyle(
                                    fontSize: Constant.textSP_18,
                                    color: ref.watch(colorProvider)['text'],
                                  ),
                                ),
                                value: SizeOption.large,
                                groupValue: sizeState.selectedSize,
                                onChanged: (size) {
                                  sizeNotifier.selectSize(size!);
                                  ref.read(chartWidgetWidthProvider.notifier).state = 1000;
                                  ref.read(chartWidgetHeightProvider.notifier).state = 700;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                          //清除选中的widget
                          ref.read(selectedWidgetProvider.notifier).state = null;
                          unawaited(SmartDialog.dismiss(tag: "AddChartWidget"));
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
                          final widgetTitle = ref.read(widgetTitleProvider.notifier).state;
                          final thing = ref.read(thingProvider.notifier).state;
                          final chartType = ref.read(chartTypeProvider.notifier).state;
                          if (widgetTitle.isEmpty) {
                            unawaited(SmartDialog.showToast("Please enter title"));
                          } else if (thing.isEmpty) {
                            unawaited(SmartDialog.showToast("Please enter device"));
                          } else if (chartType.isEmpty) {
                            unawaited(SmartDialog.showToast("Please enter chart type"));
                          } else {
                            final chartWidgetModel = BoardsChartWidgetModel(
                              id: 0,
                              boardId: ref.watch(pageProvider.notifier).getTab(ref.watch(indexBoardsProvider)).id,
                              title: ref.read(widgetTitleProvider),
                              deviceId: ref
                                  .read(itemsDeviceModelProvider)
                                  .firstWhere((element) => element.name == ref.read(thingProvider),
                                      orElse: () => DeviceModel(id: ""))
                                  .id,
                              backgroundColor: ref.read(widgetBackgroundColorProvider).value.toRadixString(16),
                              width: ref.read(chartWidgetWidthProvider),
                              height: ref.read(chartWidgetHeightProvider),
                              description: "Chart Widget Description",
                              chartType: ref.read(chartTypeProvider) == "Line" ? "line" : "bar",
                              type: "chart",
                              isShowConnectedStatus: ref.read(widgetIsShowConnectedStatusProvider),
                              position_x: widget.model?.position_x ?? 0,
                              position_y: widget.model?.position_y ?? 0,
                              reading: getReadingByWidgetReadingProviderInChart(ref.read(widgetReadingProvider)),
                              period: getPeriodByWidgetReadingProviderInChart(ref.read(widgetReadingProvider)),
                            );
                            if (widget.model != null) {
                              chartWidgetModel.id = widget.model?.id ?? 0;
                              //编辑
                              AddBoardsWidgetResponseEntity result = await ref
                                  .read(updateBoardsWidgetProvider.notifier)
                                  .editBoardsWidget(chartWidgetModel, ref.read(loginProvider).data?.token);

                              if (result.code == 100001) {
                                ref.watch(chartWidgetsProvider.notifier).updateChartWidget(chartWidgetModel);
                                unawaited(SmartDialog.dismiss(tag: "AddChartWidget"));
                              } else {
                                unawaited(SmartDialog.showToast("Failed to edit widget"));
                              }
                            } else {
                              //新增
                              AddBoardsWidgetResponseEntity result = await ref
                                  .read(addBoardsWidgetProvider.notifier)
                                  .addBoardsWidget(chartWidgetModel, ref.read(loginProvider).data?.token);
                              if (result.code == 100001) {
                                chartWidgetModel.id = result.data?.widgetId ?? 0;
                                ref.watch(chartWidgetsProvider.notifier).addChartWidget(chartWidgetModel);
                                unawaited(SmartDialog.dismiss(tag: "AddChartWidget"));
                              } else {
                                unawaited(SmartDialog.showToast("Failed to add widget"));
                              }
                            }
                          }
                        },
                        style: ButtonStyle(
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
          ),
        ],
      ),
    );
  }
}
