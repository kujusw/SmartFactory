import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_factory/extension/string_extension.dart';
import '../../../common/styles/theme.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../common/values/index.dart';
import '../../../models/login_model.dart';
import '../../common/widget/rounded_loading_button.dart';
import '../notifier/login_notifier.dart';

class ResetView extends ConsumerWidget {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  final TextEditingController emailController = TextEditingController()..text = "";
  final obscureTextProvider = StateProvider((ref) => true);

  final resettips = StateProvider.autoDispose((ref) => "");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ResetPasswordResponseEntity?>(resetPasswordrProvider, (previous, next) async {
      LoggerManager().d("重置密码结果 next:" + next.toString());
      if (next?.code == 100001) {
        _btnController.success();
        Future.delayed(Duration(seconds: 2), () {
          _btnController.reset();
        });
        ref.read(resettips.notifier).state = "Please verify the link in your email to reset your password";
      } else {
        _btnController.error();
        Future.delayed(Duration(seconds: 2), () {
          _btnController.reset();
        });
        ref.read(resettips.notifier).state = "Reset failed";
      }
    });
    return Center(
      child: Container(
        height: 300.h,
        width: 600.w,
        padding: EdgeInsets.all(30.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.w),
          color: ref.watch(colorProvider)['backgroundColorWidget'],
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username or E-Mail
            Text(
              "E-Mail",
              style: TextStyle(
                fontSize: Constant.textSP_20,
                color: ref.watch(colorProvider)['text'],
              ),
            ),
            Center(
              child: TextField(
                style: TextStyle(
                  fontSize: Constant.textSP_20,
                  color: ref.watch(colorProvider)['text'],
                ),
                controller: emailController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 20.h),
                  hintText: "E-Mail",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ref.watch(colorProvider)['accentColor']!,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ref.watch(colorProvider)['accentColor']!,
                    ),
                  ),
                  prefixIcon: Icon(Icons.email, color: ref.watch(colorProvider)['white']),
                  suffixIcon: IconButton(
                    onPressed: () {
                      emailController.clear();
                    },
                    icon: Icon(Icons.close, color: ref.watch(colorProvider)['white']),
                  ),
                ),
              ),
            ),

            // 间距
            SizedBox(height: 20.h),
            // Sign In
            Builder(
              builder: (context) {
                return RoundedLoadingButton(
                  height: 64.h,
                  loaderSize: 60.w,
                  width: 600.w,
                  color: ref.watch(colorProvider)['accentColor'],
                  successColor: Colors.green,
                  controller: _btnController,
                  onPressed: () async => {
                    FocusScope.of(context).unfocus(),
                    //不能为空
                    if (emailController.text.isEmpty)
                      {
                        _btnController.reset(),
                        ref.read(resettips.notifier).state = "E-Mail cannot be empty",
                      }
                    else if (!emailController.text.isValidEmail())
                      {
                        _btnController.reset(),
                        ref.read(resettips.notifier).state = "E-Mail format is incorrect",
                      }
                    else
                      {
                        ref.read(resettips.notifier).state = "",
                        ref.read(resetPasswordrProvider.notifier).resetPassword(
                              ResetPasswordRequestEntity(email: emailController.text),
                            ),
                      }
                  },
                  valueColor: Colors.white,
                  borderRadius: 20.w,
                  child: Text("Reset Password", style: TextStyle(color: Colors.white, fontSize: Constant.textSP_20)),
                );
              },
            ),
            Visibility(
              child: Text(
                ref.read(resettips),
                style: TextStyle(color: Colors.red, fontSize: Constant.textSP_16),
              ),
              visible: ref.watch(resettips).isNotEmpty,
            ),
            // 间距
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 文字
                Text(
                  ref.watch(signinProvider) == "SIGNIN" ? "Forgot Password?" : "Remember Password?",
                  style: TextStyle(
                    fontSize: Constant.textSP_16,
                    fontWeight: FontWeight.w600,
                    color: ref.watch(colorProvider)['text'],
                  ),
                ),
                SizedBox(width: 10.w),
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(ref.watch(colorProvider)['accentColor']),
                  ),
                  onPressed: () {
                    ref.watch(signinProvider) == "SIGNIN"
                        ? ref.read(signinProvider.notifier).state = "RESET"
                        : ref.read(signinProvider.notifier).state = "SIGNIN";
                  },
                  icon: Icon(
                    Icons.west,
                    color: ref.watch(colorProvider)['white'],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
