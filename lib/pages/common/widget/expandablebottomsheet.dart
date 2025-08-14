import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableBottomSheet extends StatefulWidget {
  final String title;
  final Widget content;
  final bool isExpand;

  const ExpandableBottomSheet({super.key, required this.content, required this.title, required this.isExpand});

  @override
  _ExpandableBottomSheetState createState() => _ExpandableBottomSheetState();
}

class _ExpandableBottomSheetState extends State<ExpandableBottomSheet> {
  double sheetHeight = 0.5;
  double maxHeight = 0.8;
  double minHeight = 0.5;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * sheetHeight,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 40.w, right: 20.w, top: 5.h, bottom: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.w),
                topRight: Radius.circular(60.w),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: widget.isExpand,
                        child: IconButton(
                          icon: (sheetHeight == 0.8 && widget.isExpand)
                              ? const Icon(
                                  Icons.fullscreen_exit,
                                )
                              : const Icon(
                                  Icons.fullscreen,
                                ),
                          onPressed: () {
                            sheetHeight == 0.8 ? _shrinkBottomSheet() : _expandBottomSheet();
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: widget.content,
          ),
        ],
      ),
    );
  }

  void _expandBottomSheet() {
    setState(() {
      sheetHeight = (sheetHeight + 0.3).clamp(minHeight, maxHeight);
    });
  }

  void _shrinkBottomSheet() {
    setState(() {
      sheetHeight = (sheetHeight - 0.3).clamp(minHeight, maxHeight);
    });
  }
}
