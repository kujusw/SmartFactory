import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common/utils/screenutil.dart';
import '../../../../common/styles/theme.dart';
import '../../../../common/values/index.dart';
import '../../../../models/locationresponseentity.dart';
import '../../../things/notifier/things_notifier.dart';

class LocationListViewInAddUser extends ConsumerWidget {
  final List<LocationModel> locationModels;
  LocationListViewInAddUser(this.locationModels);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 420.h,
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
                          //多选
                          if (ref.watch(selectedLocationProviderInUsers).contains(locationModels[index])) {
                            ref.read(selectedLocationProviderInUsers.notifier).removeLocation(locationModels[index]);
                          } else {
                            ref.read(selectedLocationProviderInUsers.notifier).addLocation(locationModels[index]);
                          }
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
                                visible: ref.watch(selectedLocationProviderInUsers).contains(locationModels[index]),
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
