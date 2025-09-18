import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../boards/view/boardsview.dart';
import '../../common/widget/flutter_lazy_indexed_stack.dart';
import '../../common/widget/header.dart';
import '../../common/widget/side_menu.dart';
import '../../settings/view/settingsview.dart';
import '../../things/view/thingsview.dart';
import '../repository/state_home.dart';
import 'customfloatingactionbuttonlocation.dart';
import 'noanimationfloatingactionbuttonanimator.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final state = HomeState();

  // Future<void> connectMqtt(WidgetRef ref) async {
  //   state.mqttManager = MqttManager(Constant.HOST_MQTT, Constant.PLATFORM + state.getRandom().toString(),
  //       username: "liuqi", password: "lq920527");
  //   // 连接到服务器
  //   await state.mqttManager?.connect(ref);
  //   LoggerManager().d('MQTT connect  ${state.mqttManager?.client?.connectionStatus}');
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //如果token为空，跳转到登录页面
      // if (ref.read(loginProvider).data?.token == null) {
      //   GoRouter.of(context).go('/login');
      // }
      ref.read(indexHomeProvider.notifier).setIndex(0);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // unawaited(connectMqtt(ref));
    // // 创建定时任务，每30秒检查一次MQTT状态
    // state.myTimer = Timer.periodic(Duration(seconds: 30), (timer) {
    //   if (state.mqttManager?.client?.connectionStatus?.state == MqttConnectionState.connected) {
    //     LoggerManager().d('MQTT connected');
    //   } else {
    //     LoggerManager().d('MQTT disconnected');
    //     unawaited(connectMqtt(ref));
    //   }
    // });
  }

  @override
  void dispose() {
    // 在这里执行清理工作，例如取消订阅、关闭流或释放资源
    // state.myTimer?.cancel();
    // if (state.mqttManager?.client?.connectionStatus?.state == MqttConnectionState.connected) {
    //   state.mqttManager?.disconnect();
    // }
    // state.mqttManager?.clean();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ref.watch(colorProvider)['backgroundColorWhole'],
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100.w,
              child: SideMenu(),
            ),
            SizedBox(
              width: 1820.w,
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 80.h, child: const Header()),
                    SizedBox(
                      height: 1000.h,
                      child: LazyIndexedStack(
                        index: ref.watch(indexHomeProvider),
                        children: const [
                          BoardsView(),
                          ThingsView(),
                          SettingsView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ref.watch(colorProvider)['accentColor'],
        onPressed: () {},
        child: Icon(Icons.done, color: ref.watch(colorProvider)['white'], size: 30.h),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(-100, -100),
      floatingActionButtonAnimator: NoAnimationFloatingActionButtonAnimator(),
    );
  }
}
