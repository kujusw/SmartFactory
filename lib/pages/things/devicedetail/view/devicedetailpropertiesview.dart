// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/styles/assets.dart';
import '../../../../common/styles/theme.dart';
import '../../../../common/values/index.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../../models/device_model.dart';
import '../../../boards/general/notifier/device_notifier.dart';
import '../../../common/customstartitletextfield.dart';
import '../../adddevice/view/getdevicelistviewinadddevice.dart';
import '../../adddevice/view/getsearchdevicelistviewinadddevice.dart';
import '../../notifier/things_notifier.dart';

class DeviceDetailPropertiesView extends ConsumerStatefulWidget {
  final DeviceModel? model;
  DeviceDetailPropertiesView(this.model, {super.key});
  @override
  ConsumerState<DeviceDetailPropertiesView> createState() => _DeviceDetailPropertiesViewState();
}

class _DeviceDetailPropertiesViewState extends ConsumerState<DeviceDetailPropertiesView> {
  final TextEditingController searchController = TextEditingController()..text = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(updateDeviceNameProvider.notifier).state = widget.model?.name ?? "";
        ref.read(itemsSelectDeviceModelProviderInThings.notifier).state = [];
        //先所有的重置选中selectedInAddDevice
        ref.read(itemsDeviceModelProvider.notifier).unSelectDevice();
        for (var item in ref.read(itemsDeviceModelProvider)) {
          for (var selectItem in widget.model?.associatedDeviceIds ?? []) {
            if (item.id == selectItem) {
              item.selectedInAddDevice = true;
            }
          }
        }
      },
    );
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
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
              child: Text(
                'Device Info',
                style: TextStyle(
                  fontSize: Constant.textSP_20,
                  color: ref.watch(colorProvider)['text'],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StarredTextField(
                  width: 250.w,
                  title: 'Device Name',
                  initialValue: widget.model?.name ?? '',
                  isEnable: true,
                  onChanged: (value) {
                    ref.read(updateDeviceNameProvider.notifier).state = value;
                  },
                ),
                StarredTextField(
                  width: 250.w,
                  title: 'Serial Number',
                  initialValue: widget.model?.id ?? '',
                  starShow: false,
                  isEnable: false,
                  onChanged: (value) {},
                ),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ref.watch(colorProvider)['backgroundColorIconButton'], // 设置背景颜色
                    ),
                    child: Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: ref.watch(colorProvider)['text'],
                            size: 30.sp,
                          ),
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(
                                ref.watch(colorProvider)['accentColor']?.withValues(alpha: 0.3)),
                          ),
                          onPressed: () {
                            ref.refresh(devicesProvider);
                          },
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 0.w,
                  top: 10.h,
                  bottom: 10.h,
                  child: Container(
                    width: 240.w,
                    height: 50.h,
                    padding: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.h),
                      shape: BoxShape.rectangle,
                      color: ref.watch(colorProvider)['backgroundColorIconButton'],
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer(
                        builder: (contextConsumer, ref, child) {
                          return Builder(
                            builder: (context) {
                              return TextField(
                                style: TextStyle(
                                  fontSize: Constant.textSP_14,
                                  color: ref.watch(colorProvider)['text'],
                                ),
                                onChanged: (value) {
                                  ref.read(vualeSearchProviderInThings.notifier).state = value;
                                  //通过是否有值替换下面的列表
                                },
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText: "Search Device",
                                  hintStyle:
                                      TextStyle(fontSize: Constant.textSP_14, color: ref.watch(colorProvider)['text']),
                                  contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      if (ref.read(vualeSearchProviderInThings).toString().length > 0) {
                                        ref.read(vualeSearchProviderInThings.notifier).state = "";
                                        searchController.clear();
                                      }
                                    },
                                    child: ref.watch(vualeSearchProviderInThings).toString().length > 0
                                        ? Icon(
                                            Icons.close,
                                            color: ref.watch(colorProvider)['text'],
                                            size: 20.sp,
                                          )
                                        : ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                              ref.watch(colorProvider)['white']!,
                                              BlendMode.srcIn,
                                            ),
                                            child: SvgPicture.asset(
                                              AssetsImages.searchIconSvg,
                                              height: 20.h,
                                              width: 20.h,
                                            ),
                                          ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Consumer(builder: (context, ref, child) {
              return ref.watch(vualeSearchProviderInThings).toString().length > 0
                  ? SearchDeviceListViewInAddDevice(type: "DETAIL")
                  : DeviceListViewInAddDevice(type: "DETAIL");
            }),
          ],
        ),
      ),
    );
  }
}
