import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../common/styles/assets.dart';
import '../../common/styles/theme_state_notifier.dart';
import '../../common/values/index.dart';
import '../../models/all_things_group_model.dart';

class AllThingsGroupsItem extends ConsumerWidget {
  final AllThingsGroupsModel item;
  const AllThingsGroupsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  ref.watch(colorProvider)['white']!,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  AssetsImages.checkboxSvg,
                  height: 15.h,
                  width: 15.h,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                item.name ?? "",
                style: TextStyle(
                  fontSize: Constant.textSP_14,
                  color: ref.watch(colorProvider)['text'],
                ),
              ),
            ],
          ),
          Text(
            // ref
            //     .read(itemsDeviceModelProvider)
            //     .where((element) => element.l?.contains(item.name) ?? false)
            //     .length
            //     .toString(),
            "0",
            style: TextStyle(
              fontSize: Constant.textSP_14,
              color: ref.watch(colorProvider)['text'],
            ),
          ),
        ],
      ),
    );
  }
}
