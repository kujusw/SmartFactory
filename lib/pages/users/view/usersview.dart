import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/styles/theme.dart';
import '../../common/widget/usersview_header.dart';
import '../locationstab/view/locationstabview.dart';
import '../notifier/users_notifier.dart';
import '../rolestab/view/rolestabview.dart';
import '../userstab/view/userstabview.dart';

class UsersView extends ConsumerWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.watch(colorProvider)['backgroundColorWhole'],
      body: Container(
        width: 1820.w,
        height: 1010.h,
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: SizedBox(
                height: 60.h,
                child: UsersViewHeader(),
              ),
            ),
            SizedBox(
              height: 920.h,
              child: ref.watch(indexUsersProvider) == 0
                  ? UsersTableWidget()
                  : ref.watch(indexUsersProvider) == 1
                      ? RolesTableWidget()
                      : ref.watch(indexUsersProvider) == 2
                          ? LocationsTableWidget()
                          : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
