// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/boards_tab_model.dart';
import '../../common/draggableboard.dart';

class DailySOBView extends ConsumerStatefulWidget {
  const DailySOBView({super.key});
  @override
  ConsumerState<DailySOBView> createState() => _DailySOBViewState();
}

class _DailySOBViewState extends ConsumerState<DailySOBView> {
  BoardsTabModel? tab;

  @override
  void initState() {
    super.initState();
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
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 20.h),
      child: DraggableBoard(),
    );
  }
}
