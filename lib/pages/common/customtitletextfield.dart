import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/styles/theme_state_notifier.dart';
import '../../common/utils/logger_manager.dart';
import '../../common/values/index.dart';

class CustomTitleTextField extends ConsumerStatefulWidget {
  final String title;
  final String hintText;
  final String initialValue;
  final TextEditingController? controller;
  final bool isEnable;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final void Function(String)? onEditingComplete;

  const CustomTitleTextField({
    required this.title,
    required this.hintText,
    required this.initialValue,
    this.controller,
    required this.onChanged,
    this.onEditingComplete,
    this.keyboardType = TextInputType.text,
    this.isEnable = true,
    super.key,
  });

  @override
  ConsumerState<CustomTitleTextField> createState() => _CustomTitleTextFieldState();
}

class _CustomTitleTextFieldState extends ConsumerState<CustomTitleTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant CustomTitleTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null && oldWidget.initialValue != widget.initialValue) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: Constant.textSP_18,
              color: ref.watch(colorProvider)['text'],
            ),
          ),
          Container(
            height: 30.h,
            margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              border: Border.all(
                color: ref.watch(colorProvider)['dividerColor']!,
              ),
              shape: BoxShape.rectangle,
            ),
            child: TextField(
              enabled: widget.isEnable,
              style: TextStyle(
                fontSize: Constant.textSP_12,
                color: ref.watch(colorProvider)['text'],
              ),
              controller: _controller,
              keyboardType: widget.keyboardType,
              onChanged: (value) {
                LoggerManager().d("value: $value");
                widget.onChanged(value);
              },
              onEditingComplete: () {
                if (widget.onEditingComplete != null) {
                  widget.onEditingComplete!(_controller.text); // 回调当前输入内容
                }
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: Constant.textSP_12, color: ref.watch(colorProvider)['text']),
                contentPadding: EdgeInsets.zero,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
