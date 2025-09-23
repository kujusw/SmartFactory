import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/values/index.dart';
import '../../../common/customstartitletextfieldselected.dart';
import '../../../common/linechart.dart';

class DeviceDetailChartsView extends ConsumerWidget {
  const DeviceDetailChartsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StarredTextFieldSelected(
                  width: 180.w,
                  title: 'Chart Type',
                  titleSize: Constant.textSP_18,
                  initialValue: 'Line Chart',
                  isEnable: false,
                  starShow: false,
                  onChanged: (value) {},
                  suffixIconOnTap: () {},
                ),
                StarredTextFieldSelected(
                  width: 180.w,
                  title: 'Aggregation Method',
                  titleSize: Constant.textSP_18,
                  initialValue: 'None',
                  starShow: false,
                  isEnable: false,
                  onChanged: (value) {},
                  suffixIconOnTap: () {},
                ),
                StarredTextFieldSelected(
                  width: 180.w,
                  title: 'Aggregation Times',
                  titleSize: Constant.textSP_18,
                  initialValue: 'All',
                  starShow: false,
                  isEnable: false,
                  onChanged: (value) {},
                  suffixIconOnTap: () {},
                ),
              ],
            ),
            StarredTextFieldSelected(
              title: 'Readings',
              initialValue: '',
              starShow: false,
              isEnable: true,
              onChanged: (value) {},
              suffixIconOnTap: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StarredTextFieldSelected(
                  width: 280.w,
                  title: 'Time Range',
                  titleSize: Constant.textSP_18,
                  initialValue: 'Today',
                  isEnable: false,
                  starShow: false,
                  onChanged: (value) {},
                  suffixIconOnTap: () {},
                ),
                StarredTextFieldSelected(
                  width: 280.w,
                  title: 'Custom Time Range',
                  titleSize: Constant.textSP_18,
                  initialValue: 'None',
                  starShow: false,
                  isEnable: false,
                  onChanged: (value) {},
                  suffixIconOnTap: () {},
                ),
              ],
            ),
            SizedBox(height: 20.h),
            LineChartWidget(),
          ],
        ),
      ),
    );
  }
}
