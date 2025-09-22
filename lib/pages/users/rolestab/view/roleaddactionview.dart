import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_factory/pages/users/notifier/permissionselectuimanager.dart';
import 'package:smart_factory/pages/users/notifier/roleaddhttpmanager.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/values/index.dart';
import '../../../../models/user_role_model.dart';
import '../../../common/customtitletextfield.dart';
import '../../../login/notifier/login_notifier.dart';
import '../../notifier/users_notifier.dart';
import 'permissiontable.dart';

class AddRoleWidgetView extends ConsumerStatefulWidget {
  final String type;
  final RoleModel? roleModel;
  AddRoleWidgetView({super.key, required this.type, required this.roleModel});
  @override
  ConsumerState<AddRoleWidgetView> createState() => _AddRoleWidgetViewState();
}

class _AddRoleWidgetViewState extends ConsumerState<AddRoleWidgetView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (widget.roleModel != null) {
          ref.read(addRoleNameProvider.notifier).set(widget.roleModel!.name ?? "");
          ref.read(permissionSelectUIManagerProvider.notifier).resetPermissionSelects();
          for (var item in ref.read(permissionSelectUIManagerProvider)) {
            for (var item2 in widget.roleModel!.permissions ?? []) {
              if (item.module == item2.module) {
                if (item2.name == "read") {
                  ref.read(permissionSelectUIManagerProvider.notifier).updatePermissionSelect(
                        PermissionSelect(
                          module: item.module,
                          read: true,
                          write: item.write,
                        ),
                      );
                } else if (item2.name == "write") {
                  ref.read(permissionSelectUIManagerProvider.notifier).updatePermissionSelect(
                        PermissionSelect(
                          module: item.module,
                          read: item.read,
                          write: true,
                        ),
                      );
                }
              }
            }
          }
        }
      },
    );
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
      width: 600.w,
      height: 1080.h,
      color: ref.watch(colorProvider)['backgroundColorRightAction'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.type == "ADD" ? "Add Role" : "Role Details",
                  style: TextStyle(
                    fontSize: Constant.textSP_18,
                    color: ref.watch(colorProvider)['white'],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
                  },
                  color: ref.watch(colorProvider)['white'],
                ),
              ],
            ),
          ),
          Container(
            height: 940.h,
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTitleTextField(
                    title: 'Name',
                    hintText: 'Enter Name',
                    initialValue: widget.roleModel?.name ?? "",
                    onChanged: (value) {
                      ref.read(addRoleNameProvider.notifier).set(value);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                      "Select Permissions",
                      style: TextStyle(
                        fontSize: Constant.textSP_18,
                        color: ref.watch(colorProvider)['white'],
                      ),
                    ),
                  ),
                  Container(height: 680.h, child: PermissionTable()),
                ],
              ),
            ),
          ),
          Container(
            color: ref.watch(colorProvider)['backgroundColorWidget'],
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: Constant.textSP_18,
                      color: ref.watch(colorProvider)['grey'],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final name = ref.read(addRoleNameProvider);
                    if (name.isEmpty) {
                      unawaited(SmartDialog.showToast("Please enter name"));
                    } else {
                      if (widget.type == "ADD") {
                        List<int> permissionIds = [];
                        for (var item in ref.read(permissionSelectUIManagerProvider)) {
                          for (var item2 in ref.read(permissionListProvider)) {
                            if (item.module == item2.module) {
                              if ((item2.name == "read" && item.read == true) ||
                                  (item2.name == "write" && item.write == true)) {
                                permissionIds.add(item2.id ?? 0);
                              }
                            }
                          }
                        }
                        bool result = await ref.read(addRoleProvider.notifier).addRole(
                            AddRoleRequestEntity(
                              name: name,
                              permissionIds: permissionIds,
                            ),
                            ref.read(loginProvider).data?.token ?? "");
                        if (result) {
                          unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
                        } else {
                          unawaited(SmartDialog.showToast("Failed to add role"));
                        }
                      } else if (widget.type == "EDIT") {
                        List<int> permissionIds = [];
                        for (var item in ref.read(permissionSelectUIManagerProvider)) {
                          for (var item2 in ref.read(permissionListProvider)) {
                            if (item.module == item2.module) {
                              if ((item2.name == "read" && item.read == true) ||
                                  (item2.name == "write" && item.write == true)) {
                                permissionIds.add(item2.id ?? 0);
                              }
                            }
                          }
                        }
                        bool result = await ref.read(roleAddHttpManagerProvider.notifier).updateRole(
                            widget.roleModel?.id,
                            AddRoleRequestEntity(
                              name: name,
                              permissionIds: permissionIds,
                            ),
                            ref.read(loginProvider).data?.token);
                        if (result) {
                          unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
                        } else {
                          unawaited(SmartDialog.showToast("Failed to update role"));
                        }
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(ref.watch(colorProvider)['main']!),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: Constant.textSP_18,
                      color: ref.watch(colorProvider)['white'],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
