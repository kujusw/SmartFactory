import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../core/notifiers/floatbuttonmanager.dart';
import '../../../../things/view/thingsviewaddactionview.dart';

List<Widget> getThingsFabButtons(WidgetRef ref) {
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
          ref.read(floatButtonProvider.notifier).change("ThingsViewAdd");
          unawaited(SmartDialog.show(
            usePenetrate: false,
            alignment: Alignment.centerRight,
            clickMaskDismiss: true,
            keepSingle: true,
            tag: "ThingsViewAddActionButton",
            builder: (_) => ThingsViewAddActionView(),
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
          ref.read(floatButtonProvider.notifier).change("ThingsViewEdit");
          unawaited(SmartDialog.show(
            usePenetrate: false,
            alignment: Alignment.centerRight,
            clickMaskDismiss: true,
            keepSingle: true,
            tag: "ThingsViewEditActionButton",
            builder: (_) => Container(
              width: 600.w,
              height: 1080.h,
              color: Colors.red,
              child: Center(child: Text("你好 Edit", style: TextStyle(color: Colors.white))),
            ),
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
