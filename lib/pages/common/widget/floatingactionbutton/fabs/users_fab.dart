import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../core/notifiers/floatbuttonmanager.dart';
import '../../../../users/locationstab/view/locationaddactionview.dart';
import '../../../../users/notifier/users_notifier.dart';
import '../../../../users/rolestab/view/roleaddactionview.dart';
import '../../../../users/userstab/view/useraddactionview.dart';

List<Widget> getUsersFabButtons(WidgetRef ref) {
  return [
    FABAdd(ref),
    FABEdit(ref),
  ];
}

class FABAdd extends StatelessWidget {
  WidgetRef ref;
  FABAdd(this.ref, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h),
      color: ref.watch(colorProvider)['transparent'],
      child: FloatingActionButton(
        backgroundColor: ref.watch(colorProvider)['backgroundColorWidget'],
        onPressed: () {
          ref.read(floatButtonProvider.notifier).change("UsersViewAdd");
          unawaited(SmartDialog.show(
            usePenetrate: false,
            alignment: Alignment.centerRight,
            clickMaskDismiss: true,
            keepSingle: true,
            tag: "UsersViewAddActionButton",
            builder: (_) {
              if (ref.watch(indexUsersProvider) == 0) {
                return AddUserWidgetView(type: "ADD", userModel: null);
              } else if (ref.watch(indexUsersProvider) == 1) {
                return AddRoleWidgetView(type: "ADD", roleModel: null);
              } else {
                return AddLocationWidgetView(type: "ADD", locationModel: null);
              }
            },
            onDismiss: () {
              ref.read(floatButtonProvider.notifier).change("");
            },
          ));
        },
        heroTag: "Add",
        tooltip: 'Add',
        child: Icon(
          Icons.add,
          color: ref.watch(colorProvider)['white'],
        ),
      ),
    );
  }
}

class FABEdit extends StatelessWidget {
  WidgetRef ref;
  FABEdit(this.ref, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h),
      color: ref.watch(colorProvider)['transparent'],
      child: FloatingActionButton(
        backgroundColor: ref.watch(colorProvider)['backgroundColorWidget'],
        onPressed: () {
          ref.read(floatButtonProvider.notifier).change("UsersViewEdit");
          unawaited(SmartDialog.show(
            usePenetrate: false,
            alignment: Alignment.centerRight,
            clickMaskDismiss: true,
            keepSingle: true,
            tag: "UsersViewAddActionButton",
            builder: (_) {
              if (ref.watch(indexUsersProvider) == 0) {
                return AddUserWidgetView(type: "EDIT", userModel: null);
              } else if (ref.watch(indexUsersProvider) == 1) {
                return AddRoleWidgetView(type: "EDIT", roleModel: null);
              } else {
                return AddLocationWidgetView(type: "EDIT", locationModel: null);
              }
            },
            onDismiss: () {
              ref.read(floatButtonProvider.notifier).change("");
            },
          ));
        },
        heroTag: "Edit",
        tooltip: 'Edit',
        child: Icon(
          Icons.edit,
          color: ref.watch(colorProvider)['white'],
        ),
      ),
    );
  }
}
