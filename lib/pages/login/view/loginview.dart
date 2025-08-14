import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../common/styles/theme.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../common/values/constant.dart';
import '../../../models/login_model.dart';
import '../../common/widget/rounded_loading_button.dart';
import '../notifier/login_notifier.dart';
import 'resetview.dart';
// import 'dart:html' as html;

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  final TextEditingController usernameController = TextEditingController()..text = "ggliuqi527@gmail.com";
  final TextEditingController passController = TextEditingController()..text = "KJlq920527!";

  final obscureTextProvider = StateProvider((ref) => true);
  final logintips = StateProvider.autoDispose((ref) => "");
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _focusNode.addListener(() {
          if (_focusNode.hasFocus) {
            HardwareKeyboard.instance.addHandler(_handleKeyPress);
          } else {
            HardwareKeyboard.instance.removeHandler(_handleKeyPress);
          }
        });
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyPress);
    _focusNode.dispose();
    super.dispose();
  }

  FocusNode _focusNode = FocusNode();

  bool _handleKeyPress(KeyEvent event) {
    LoggerManager().d("event: ${event.logicalKey}");
    if (event.logicalKey == LogicalKeyboardKey.enter) {
      _btnController.start();
      return true;
    }
    return false;
  }

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
          icon: Icon(ref.watch(obscureTextProvider) ? Icons.visibility_off : Icons.visibility,
              color: ref.watch(colorProvider)['white']),
        ),
      ],
    );
  }

  // 登录表单
  Widget _buildForm(WidgetRef ref, BuildContext context) {
    ref.listen<LoginResponseEntity?>(loginProvider, (previous, next) async {
      if (next?.code == 100001) {
        _btnController.success();
        Future.delayed(Duration(seconds: 2), () {
          _btnController.reset();
        });
        context.go('/home');
      } else {
        _btnController.error();
        Future.delayed(Duration(seconds: 2), () {
          _btnController.reset();
        });
        ref.read(logintips.notifier).state = "Login failed: ${next?.message}";
      }
    });
    return Center(
      child: Container(
        height: 420.h,
        width: 600.w,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
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
              "Username or E-Mail",
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
                controller: usernameController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 20.h),
                  hintText: "Username or E-Mail",
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
                  prefixIcon: Icon(Icons.person, color: ref.watch(colorProvider)['white']),
                  suffixIcon: IconButton(
                    onPressed: () {
                      usernameController.clear();
                    },
                    icon: Icon(Icons.close, color: ref.watch(colorProvider)['white']),
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
                color: ref.watch(colorProvider)['text'],
              ),
            ),
            Center(
              child: TextField(
                focusNode: _focusNode,
                style: TextStyle(
                  fontSize: Constant.textSP_20,
                  color: ref.watch(colorProvider)['text'],
                ),
                controller: passController,
                obscureText: ref.read(obscureTextProvider),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
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
                  prefixIcon: Icon(Icons.lock, color: ref.watch(colorProvider)['white']),
                  suffixIcon: _suffixIconView(ref),
                ),
              ),
            ),

            // 间距
            SizedBox(height: 30.h),
            // Sign In
            RoundedLoadingButton(
              height: 64.h,
              loaderSize: 60.w,
              width: 600.w,
              color: ref.watch(colorProvider)['accentColor'],
              successColor: Colors.green,
              controller: _btnController,
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (usernameController.text.isEmpty) {
                  ref.read(logintips.notifier).state = "Username cannot be empty";
                  _btnController.reset();
                } else if (passController.text.isEmpty) {
                  ref.read(logintips.notifier).state = "Password cannot be empty";
                  _btnController.reset();
                } else {
                  ref.read(logintips.notifier).state = "";
                  bool result = await ref.read(loginProvider.notifier).login(
                        LoginRequestEntity(
                          username: usernameController.text,
                          password: passController.text,
                        ),
                      );
                  if (result) {
                    ref.read(loginUserName.notifier).state = usernameController.text;
                    ref.read(loginTime.notifier).state = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
                  }
                  // // 创建一个隐藏的表单，用于浏览器的自动保存功能
                  // html.FormElement form = html.FormElement()
                  //   ..setAttribute('style', 'display:none;')
                  //   ..append(html.InputElement()
                  //     ..name = 'username'
                  //     ..value = usernameController.text)
                  //   ..append(html.InputElement()
                  //     ..name = 'password'
                  //     ..value = passController.text)
                  //   ..submit();

                  // // 将隐藏的表单添加到文档中
                  // html.document.body?.append(form);
                }
              },
              valueColor: Colors.white,
              borderRadius: 20.w,
              child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: Constant.textSP_20)),
            ),
            SizedBox(height: 10.h),
            // 提示
            Visibility(
              child: Text(
                ref.read(logintips),
                style: TextStyle(color: Colors.red, fontSize: Constant.textSP_16),
              ),
              visible: ref.watch(logintips).isNotEmpty,
            ),
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
                    Icons.east,
                    color: ref.watch(colorProvider)['white'],
                  ),
                  // child: Text(
                  //   ref.watch(signinProvider) == "SIGNIN" ? "Reset" : "Sign In",
                  //   style: TextStyle(
                  //     fontSize: Constant.textSP_20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView(WidgetRef ref, BuildContext context) {
    return Container(
      color: ref.watch(colorProvider)['backgroundColorWhole'],
      height: 1080.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 图标
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.account_circle,
                  size: 100.h,
                ),
                onPressed: () {},
              );
            },
          ),

          // 主标
          Text(
            ref.watch(signinProvider) == "SIGNIN" ? "Welcome Sign In" : "",
            style: TextStyle(
              fontSize: Constant.textSP_30,
              fontWeight: FontWeight.bold,
              color: ref.watch(colorProvider)['text'],
            ),
          ),
          SizedBox(height: 50.h),
          // 表单
          ref.watch(signinProvider) == "SIGNIN" ? _buildForm(ref, context) : ResetView(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    initFloating(context);
    return Scaffold(
      body: SingleChildScrollView(child: _buildView(ref, context)),
    );
  }

  //避免跳过登录时 没有初始化
  void initFloating(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (Constant.floating != null && Constant.floating?.isShowing == false) {
          Constant.floating?.open(context);
        }
      },
    );
  }
}
