import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/values/index.dart';
import '../../../../models/widget_type_mode.dart';
import '../../../common/general_globalinfo_utils.dart';

class WidgetTypeItem extends StatelessWidget {
  final WidgetTypeModel _model;
  final ValueChanged<WidgetTypeModel> _cellTapCallback;

  const WidgetTypeItem({Key? key, required WidgetTypeModel model, required ValueChanged<WidgetTypeModel> callback})
      : _model = model,
        _cellTapCallback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEvent details) => () {},
      onExit: (PointerEvent details) => () {},
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: GestureDetector(
          onTap: () {
            _cellTapCallback(_model);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                addWidgetIconPathMap[_model.name] ?? "",
                height: 60.h,
                width: 60.h,
              ),
              Text(
                _model.name ?? "",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: Constant.textSP_18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
