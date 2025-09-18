import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../common/values/index.dart';
import '../../../models/register_model.dart';
import '../../common/widget/rounded_loading_button.dart';
import '../notifier/login_notifier.dart' hide obscureTextProvider, registerProvider;
import '../notifier/registermanager.dart';

class RegisterView extends ConsumerWidget {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  final TextEditingController emailController = TextEditingController()..text = "";
  final TextEditingController usernameController = TextEditingController()..text = "";
  final TextEditingController passController = TextEditingController()..text = "";

// 自定义密码的显示和隐藏
  Widget _suffixIconView(WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              ref.read(obscureTextProvider.notifier).state = !ref.read(obscureTextProvider.notifier).state;
            },
            icon: Icon(
              ref.watch(obscureTextProvider) ? Icons.visibility_off : Icons.visibility,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<RegisterResponseEntity?>(registerProvider, (previous, next) async {
      LoggerManager().d("注册结果 next:" + next.toString());
      if (next?.code == 200) {
        _btnController.success();
        Future.delayed(Duration(seconds: 2), () {
          _btnController.reset();
        });
        ref.read(registerTipsProvider.notifier).state = "Please verify the link in your email to login";
      } else if (next?.code == 600) {
        _btnController.error();
        //延迟两秒 重置
        Future.delayed(Duration(seconds: 2), () {
          _btnController.reset();
        });
        ref.read(registerTipsProvider.notifier).state = "User already exists";
      } else if (next?.code == 601) {
        _btnController.error();
        Future.delayed(Duration(seconds: 2), () {
          _btnController.reset();
        });
        ref.read(registerTipsProvider.notifier).state = "Email already registered";
      } else {
        _btnController.error();
        Future.delayed(Duration(seconds: 2), () {
          _btnController.reset();
        });
        ref.read(registerTipsProvider.notifier).state = "Register failed";
      }
    });
    return Center(
      child: Container(
        height: 600.h,
        width: 600.w,
        padding: EdgeInsets.all(30.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.w),
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
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
              ),
            ),
            Center(
              child: TextField(
                style: TextStyle(
                  fontSize: Constant.textSP_20,
                ),
                controller: emailController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 20.h),
                  hintText: "E-Mail",
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
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: IconButton(
                    onPressed: () {
                      emailController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ),
            ),

            // 间距
            SizedBox(height: 20.h),
            Text(
              "Username",
              style: TextStyle(
                fontSize: Constant.textSP_20,
              ),
            ),
            Center(
              child: TextField(
                style: TextStyle(
                  fontSize: Constant.textSP_20,
                ),
                controller: usernameController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 20.h),
                  hintText: "Username",
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
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      usernameController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ),
            ),

            // 间距
            SizedBox(height: 20.h),
            // Password
            Text(
              "Password",
              style: TextStyle(
                fontSize: Constant.textSP_20,
              ),
            ),
            Center(
              child: TextField(
                style: TextStyle(
                  fontSize: Constant.textSP_20,
                ),
                controller: passController,
                obscureText: ref.read(obscureTextProvider),
                decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding: EdgeInsets.only(top: 20.h),
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
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: _suffixIconView(ref),
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
                        ref.read(registerTipsProvider.notifier).state = "E-Mail cannot be empty",
                      }
                    else if (usernameController.text.isEmpty)
                      {
                        _btnController.reset(),
                        ref.read(registerTipsProvider.notifier).state = "Username cannot be empty",
                      }
                    else if (passController.text.isEmpty || passController.text.length < 6)
                      {
                        _btnController.reset(),
                        ref.read(registerTipsProvider.notifier).state =
                            "Password cannot be empty or less than 6 digits",
                      }
                    else
                      {
                        ref.read(registerTipsProvider.notifier).state = "",
                        ref.read(registerProvider.notifier).register(
                              RegisterRequestEntity(
                                username: usernameController.text,
                                password: passController.text,
                                email: emailController.text,
                              ),
                            ),
                      }
                  },
                  valueColor: Colors.white,
                  borderRadius: 20.w,
                  child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: Constant.textSP_20)),
                );
              },
            ),
            Visibility(
              child: Text(
                ref.read(registerTipsProvider),
                style: TextStyle(color: Colors.red, fontSize: Constant.textSP_16),
              ),
              visible: ref.watch(registerTipsProvider).isNotEmpty,
            ),
            // 间距
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 文字
                Text(
                  ref.watch(signinProvider) == "SIGNIN" ? "Don't have an account?" : "Already have an account?",
                  style: TextStyle(
                    fontSize: Constant.textSP_20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // 按钮
                SizedBox(width: 20.w),
                InkWell(
                  onTap: () {},
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(ref.watch(colorProvider)['accentColor']),
                    ),
                    onPressed: () {
                      ref.watch(signinProvider) == "SIGNIN"
                          ? ref.read(signinProvider.notifier).state = "SIGNUP"
                          : ref.read(signinProvider.notifier).state = "SIGNIN";
                    },
                    child: Text(
                      ref.watch(signinProvider) == "SIGNIN" ? "Sign Up" : "Sign In",
                      style: TextStyle(
                        fontSize: Constant.textSP_20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
