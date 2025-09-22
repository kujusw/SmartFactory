import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../common/styles/theme_state_notifier.dart';
import '../../../../../core/notifiers/floatbuttonmanager.dart';
import '../../../../boards/daily_sob/dailysobviewaddactionview.dart';

List<Widget> getBoardsFabButtons(WidgetRef ref) {
  return [
    FABAdd(ref),
    FABEdit(ref),
    FABDelete(ref),
  ];
}

class FABAdd extends StatelessWidget {
  WidgetRef ref;
  FABAdd(this.ref, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h),
      child: FloatingActionButton(
        backgroundColor: ref.watch(colorProvider)['backgroundColorWidget'],
        onPressed: () {
          ref.read(floatButtonProvider.notifier).change("BoardsViewAdd");
          unawaited(SmartDialog.show(
            usePenetrate: false,
            alignment: Alignment.centerRight,
            clickMaskDismiss: true,
            keepSingle: true,
            tag: "DailySOBViewAddActionButton",
            builder: (_) => DailySOBViewAddActionView(),
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
      child: FloatingActionButton(
        backgroundColor: ref.watch(colorProvider)['backgroundColorWidget'],
        onPressed: () {
          ref.read(floatButtonProvider.notifier).change("BoardsViewEdit");
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

class FABDelete extends StatelessWidget {
  WidgetRef ref;
  FABDelete(this.ref, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h),
      child: FloatingActionButton(
        backgroundColor: ref.watch(colorProvider)['backgroundColorWidget'],
        onPressed: () {
          ref.read(floatButtonProvider.notifier).change("BoardsViewDelete");
        },
        heroTag: "Delete",
        tooltip: 'Delete',
        child: Icon(
          Icons.delete,
          color: ref.watch(colorProvider)['white'],
        ),
      ),
    );
  }
}
