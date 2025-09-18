// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../common/widget/boardsview_header.dart';
import '../general/notifier/device_notifier.dart';
import '../general/view/generalview.dart';

class BoardsView extends ConsumerStatefulWidget {
  const BoardsView({super.key});
  @override
  ConsumerState<BoardsView> createState() => _BoardsViewState();
}

class _BoardsViewState extends ConsumerState<BoardsView> {
  @override
  void initState() {
    super.initState();
    // ref.invalidate(getUsersProvider); //刷新不关心新值
    ref.refresh(devicesProvider); //刷新并read新值
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
    return Scaffold(
      backgroundColor: ref.watch(colorProvider)['backgroundColorWhole'],
      body: Container(
        width: 1820.w,
        height: 1010.h,
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        decoration: BoxDecoration(
          color: ref.watch(colorProvider)['backgroundColorWhole'],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: SizedBox(
                height: 60.h,
                child: BoardsViewHeader(),
              ),
            ),
            SizedBox(height: 920.h, child: GeneralView()),
          ],
        ),
      ),
    );
  }
}
