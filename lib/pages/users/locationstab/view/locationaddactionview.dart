import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_factory/pages/users/notifier/locationaddhttpmanager.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/values/index.dart';
import '../../../../models/locationresponseentity.dart';
import '../../../common/customtitletextfield.dart';
import '../../../login/notifier/login_notifier.dart';
import '../../notifier/users_notifier.dart';

class AddLocationWidgetView extends ConsumerStatefulWidget {
  final String type;
  final LocationModel? locationModel;
  AddLocationWidgetView({super.key, required this.type, required this.locationModel});
  @override
  ConsumerState<AddLocationWidgetView> createState() => _AddLocationWidgetViewState();
}

class _AddLocationWidgetViewState extends ConsumerState<AddLocationWidgetView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.locationModel != null) {
        ref.read(locationProvider.notifier).set(widget.locationModel!.name ?? "");
        ref.read(buildingProvider.notifier).set(widget.locationModel!.building ?? "");
        ref.read(tenantProvider.notifier).set(widget.locationModel!.tenant ?? "");
        ref.read(areaProvider.notifier).set(widget.locationModel!.area ?? 0);
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
                  widget.type == "ADD" ? "Add Location" : "Location Details",
                  style: TextStyle(
                    fontSize: Constant.textSP_18,
                    color: ref.watch(colorProvider)['white'],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
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
                    title: 'Location',
                    hintText: 'Enter Location',
                    initialValue: widget.locationModel?.name ?? "",
                    onChanged: (value) {
                      ref.read(locationProvider.notifier).set(value);
                    },
                  ),
                  CustomTitleTextField(
                    title: 'Building',
                    hintText: 'Enter Building',
                    initialValue: widget.locationModel?.building ?? "",
                    onChanged: (value) {
                      ref.read(buildingProvider.notifier).set(value);
                    },
                  ),
                  CustomTitleTextField(
                    title: 'Tenant',
                    hintText: 'Enter Tenant',
                    initialValue: widget.locationModel?.tenant ?? "",
                    onChanged: (value) {
                      ref.read(tenantProvider.notifier).set(value);
                    },
                  ),
                  CustomTitleTextField(
                    title: 'Area',
                    hintText: 'Enter Area',
                    initialValue: (widget.locationModel?.area ?? 0).toString(),
                    onChanged: (value) {
                      try {
                        ref.read(areaProvider.notifier).set(int.parse(value));
                      } catch (e) {
                        unawaited(SmartDialog.showToast("Only numbers are allowed",
                            displayTime: Duration(milliseconds: 1500)));
                        ref.read(areaProvider.notifier).set(0);
                      }
                    },
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
                    unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
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
                    final location = ref.read(locationProvider);
                    if (location.isEmpty) {
                      unawaited(SmartDialog.showToast("Please enter location"));
                      return;
                    }
                    if (widget.type == "ADD") {
                      var result = await ref.read(addLocationProvider.notifier).addLocation(
                          AddLocationModelRequestEntity(
                            name: location,
                            building: ref.read(buildingProvider),
                            tenant: ref.read(tenantProvider),
                            area: ref.read(areaProvider),
                          ),
                          ref.read(loginProvider).data?.token ?? "");
                      if (result) {
                        unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
                      } else {
                        unawaited(SmartDialog.showToast("Failed to add location"));
                      }
                    } else if (widget.type == "EDIT") {
                      var result = await ref.read(locationAddHttpManagerProvider.notifier).updateLocation(
                          widget.locationModel?.id,
                          AddLocationModelRequestEntity(
                            name: location,
                            building: ref.read(buildingProvider),
                            tenant: ref.read(tenantProvider),
                            area: ref.read(areaProvider),
                          ),
                          ref.read(loginProvider).data?.token);
                      if (result) {
                        unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
                      } else {
                        unawaited(SmartDialog.showToast("Failed to update location"));
                      }
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
