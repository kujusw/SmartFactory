import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common/utils/screenutil.dart';
import '../../../../common/styles/theme.dart';
import '../../../../common/values/index.dart';
import '../../../../models/locationresponseentity.dart';
import '../../notifier/things_notifier.dart';

class LocationListViewInAddDevice extends ConsumerWidget {
  final List<LocationModel> locationModels;
  LocationListViewInAddDevice(this.locationModels);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 240.h,
      decoration: BoxDecoration(
        border: Border.all(color: ref.watch(colorProvider)['dividerColor']!),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: ScrollConfiguration(
        behavior:
            const MaterialScrollBehavior().copyWith(scrollbars: false, dragDevices: KJScreenUtil.kTouchLikeDeviceTypes),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(selectedLocationProviderInThings.notifier).state = locationModels[index];
                        },
                        child: Container(
                          height: 48.h,
                          width: double.infinity,
                          color: ref.watch(colorProvider)['transparent'],
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    locationModels[index].name ?? "",
                                    style: TextStyle(
                                      fontSize: Constant.textSP_14,
                                      color: ref.watch(colorProvider)['text'],
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: locationModels[index].id == ref.watch(selectedLocationProviderInThings)?.id,
                                child: Icon(
                                  Icons.done,
                                  size: 30.h,
                                  color: ref.watch(colorProvider)['accentColor'],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 1.h, color: ref.watch(colorProvider)['dividerColor'])
                    ],
                  );
                },
                childCount: locationModels.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
