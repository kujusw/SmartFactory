import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/values/index.dart';
import '../../../../models/device_model.dart';
import '../../../../models/locationresponseentity.dart';
import '../../../users/notifier/locationuimanager.dart';
import '../../adddevice/view/locationlistview.dart';
import '../../notifier/things_notifier.dart';

class DeviceDetailLocationView extends ConsumerStatefulWidget {
  final DeviceModel? model;
  DeviceDetailLocationView(this.model, {super.key});
  @override
  ConsumerState<DeviceDetailLocationView> createState() => _DeviceDetailLocationViewState();
}

class _DeviceDetailLocationViewState extends ConsumerState<DeviceDetailLocationView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(selectedLocationInThingsProvider.notifier)
          .set(LocationModel(id: widget.model?.locationId ?? 0, name: ""));
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
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Location",
                style: TextStyle(
                  fontSize: Constant.textSP_18,
                  color: ref.watch(colorProvider)['white'],
                ),
              ),
              Text(
                ref.watch(selectedLocationInThingsProvider)?.name ?? "",
                style: TextStyle(
                  fontSize: Constant.textSP_18,
                  color: ref.watch(colorProvider)['white'],
                ),
              ),
            ],
          ),
        ),
        ref.watch(getLocationsProvider).when(
              data: (data) {
                return LocationListViewInAddDevice(data);
              },
              loading: () => Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                height: 200.h,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) {
                return Container();
              },
            )
      ],
    );
  }
}
