import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_factory/extension/string_extension.dart';
import 'package:smart_factory/pages/things/notifier/location_inuser_state_notifier.dart';
import 'package:smart_factory/pages/users/notifier/locationuimanager.dart';
import 'package:smart_factory/pages/users/notifier/useraddhttpmanager.dart';
import '../../../../common/styles/theme_state_notifier.dart';
import '../../../../common/utils/logger_manager.dart';
import '../../../../common/values/index.dart';
import '../../../../models/locationresponseentity.dart';
import '../../../../models/user_manager_model.dart';
import '../../../../models/user_role_model.dart';
import '../../../boards/daily_sob/customdropdown.dart';
import '../../../common/customtitletextfield.dart';
import '../../../login/notifier/login_notifier.dart';
import '../../notifier/users_notifier.dart';
import 'locationlistviewinuser.dart';

class AddUserWidgetView extends ConsumerStatefulWidget {
  final String type;
  final UserModel? userModel;
  AddUserWidgetView({super.key, required this.type, required this.userModel});

  @override
  ConsumerState<AddUserWidgetView> createState() => _AddUserWidgetViewState();
}

class _AddUserWidgetViewState extends ConsumerState<AddUserWidgetView> {
  //添加用户

  @override
  void initState() {
    super.initState();
    LoggerManager().d("_AddUserWidgetViewState");
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (widget.userModel != null) {
          ref.read(userAddNameProvider.notifier).set(widget.userModel!.username ?? "");
          ref.read(userAddEmailProvider.notifier).set(widget.userModel!.email ?? "");
          ref.read(userAddRoleProvider.notifier).set(
                ref
                        .read(itemsRoleModelProvider)
                        .firstWhere(
                          (element) => element.id == widget.userModel!.roleId,
                          orElse: () => RoleModel(name: "", id: -1),
                        )
                        .name ??
                    "",
              );

          for (var location in widget.userModel!.locationIds ?? []) {
            ref.read(locationSelectInUserStateProvider.notifier).addLocation(
                  ref.read(locationUIManagerProvider).firstWhere(
                        (element) => element.id == location,
                        orElse: () => LocationModel(id: -1, name: ""),
                      ),
                );
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
    return ref.watch(getRolesProvider).when(
      data: (data) {
        return ref.watch(itemsRoleModelProvider).length > 0
            ? Container(
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
                            widget.type == "ADD" ? "Add User" : "User Details",
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
                              initialValue: ref.watch(userAddNameProvider),
                              onChanged: (value) {
                                ref.read(userAddNameProvider.notifier).set(value);
                              },
                            ),
                            CustomTitleTextField(
                              title: 'Email',
                              hintText: 'Enter Email',
                              initialValue: ref.watch(userAddEmailProvider),
                              isEnable: widget.type == "ADD",
                              onChanged: (value) {
                                ref.read(userAddEmailProvider.notifier).set(value);
                              },
                            ),
                            Visibility(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Text(
                                  //提示 请使用正确的邮箱地址
                                  "Please use the correct email address",
                                  style: TextStyle(
                                    color: ref.watch(colorProvider)['red'],
                                    fontSize: Constant.textSP_14,
                                  ),
                                ),
                              ),
                              visible: !ref.watch(userAddEmailValidProvider),
                            ),
                            Visibility(
                              child: CustomTitleTextField(
                                title: 'Password',
                                hintText: 'Enter Password',
                                initialValue: ref.watch(userAddPasswordProvider),
                                onChanged: (value) {
                                  ref.read(userAddPasswordProvider.notifier).set(value);
                                },
                              ),
                              visible: widget.type == "ADD",
                            ),
                            Visibility(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Text(
                                  //提示 请使用正确的邮箱地址
                                  "The password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character (!@#\$%^&*())",
                                  style: TextStyle(
                                    color: ref.watch(colorProvider)['red'],
                                    fontSize: Constant.textSP_14,
                                  ),
                                ),
                              ),
                              visible: widget.type == "ADD",
                            ),
                            CustomDropdown(
                              alignment: Alignment.bottomCenter,
                              width: 320.w,
                              title: "Role",
                              value: ref.watch(userAddRoleProvider),
                              list: ref.read(itemsRoleModelProvider).map((e) => e.name ?? "").toList(),
                              onSelected: (value) {
                                // Handle the selected value here
                                ref.read(userAddRoleProvider.notifier).set(value ?? "");
                                unawaited(SmartDialog.dismiss(tag: "SelectPopupPage"));
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Select Location",
                                    style: TextStyle(
                                      fontSize: Constant.textSP_18,
                                      color: ref.watch(colorProvider)['white'],
                                    ),
                                  ),
                                  Text(
                                    ref.watch(locationSelectInUserStateProvider).length.toString(),
                                    style: TextStyle(
                                      fontSize: Constant.textSP_18,
                                      color: ref.watch(colorProvider)['white'],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ref.watch(getLocationsProvider).when(
                                  data: (data) {
                                    return LocationListViewInAddUser(data);
                                  },
                                  loading: () => Container(
                                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                                    height: 200.h,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  error: (error, stack) {
                                    return Container();
                                  },
                                )
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
                              final name = ref.read(userAddNameProvider);
                              final email = ref.read(userAddEmailProvider);
                              final password = ref.read(userAddPasswordProvider);
                              final role = ref.read(userAddRoleProvider);
                              final roleId;

                              if (widget.type == "ADD") {
                                if (name.isEmpty) {
                                  unawaited(SmartDialog.showToast("Please enter name"));
                                } else if (email.isEmpty) {
                                  unawaited(SmartDialog.showToast("Please enter email"));
                                } else if (password.isEmpty) {
                                  unawaited(SmartDialog.showToast("Please enter password"));
                                } else if (ref.read(locationSelectInUserStateProvider).length < 1) {
                                  unawaited(SmartDialog.showToast("Please select location"));
                                } else {
                                  bool emailValid = email.isValidEmail();
                                  bool passValid = password.isPasswordValid(password);
                                  if (!emailValid) {
                                    ref.read(userAddEmailValidProvider.notifier).set(false);
                                  } else if (!passValid) {
                                    unawaited(SmartDialog.showToast("Please use the correct password format"));
                                  } else if (role.isEmpty) {
                                    unawaited(SmartDialog.showToast("Please select role"));
                                  } else {
                                    roleId = ref
                                        .read(itemsRoleModelProvider)
                                        .firstWhere(
                                          (element) => element.name == role,
                                          orElse: () => RoleModel(name: "", id: -1),
                                        )
                                        .id;
                                    if (roleId == -1) {
                                      unawaited(SmartDialog.showToast("Please select role"));
                                    } else {
                                      bool result = await ref.read(addUserProvider.notifier).addUser(
                                          AddUserRequestEntity(
                                            username: name,
                                            email: email,
                                            password: password,
                                            roleId: roleId,
                                            locationIds: ref
                                                .read(locationSelectInUserStateProvider)
                                                .map((e) => e.id ?? 0)
                                                .toList(),
                                          ),
                                          ref.read(loginProvider).data?.token ?? "");
                                      if (result) {
                                        unawaited(SmartDialog.showToast(
                                            "Please check your email to confirm your registration"));
                                        unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
                                      } else {
                                        unawaited(SmartDialog.showToast("Failed to add user"));
                                      }
                                    }
                                  }
                                }
                              } else if (widget.type == "EDIT") {
                                if (name.isEmpty) {
                                  unawaited(SmartDialog.showToast("Please enter name"));
                                } else if (ref.read(locationSelectInUserStateProvider).length < 1) {
                                  unawaited(SmartDialog.showToast("Please select location"));
                                } else if (role.isEmpty) {
                                  unawaited(SmartDialog.showToast("Please select role"));
                                } else {
                                  roleId = ref
                                      .read(itemsRoleModelProvider)
                                      .firstWhere(
                                        (element) => element.name == role,
                                        orElse: () => RoleModel(name: "", id: -1),
                                      )
                                      .id;
                                  if (roleId == -1) {
                                    unawaited(SmartDialog.showToast("Please select role"));
                                  } else {
                                    bool result = await ref.read(userAddHttpManagerProvider.notifier).updateUser(
                                        widget.userModel?.id ?? 0,
                                        UpdateUserRequestEntity(
                                          username: name,
                                          roleId: roleId,
                                          locationIds: ref
                                              .read(locationSelectInUserStateProvider)
                                              .map((e) => e.id ?? 0)
                                              .toList(),
                                        ),
                                        ref.read(loginProvider).data?.token);
                                    if (result) {
                                      unawaited(SmartDialog.dismiss(tag: "UsersViewAddActionButton"));
                                    } else {
                                      unawaited(SmartDialog.showToast("Failed to update user"));
                                    }
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
              )
            : Container();
      },
      error: (Object error, StackTrace stackTrace) {
        return Container();
      },
      loading: () {
        return Container();
      },
    );
  }
}
