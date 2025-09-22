import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../../common/styles/theme_state_notifier.dart';
import '../../../common/utils/logger_manager.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../core/notifiers/floatbuttonmanager.dart';
import '../../boards/daily_sob/notifier/dailys_sob_notifier.dart';
import '../../boards/view/boardsview.dart';
import '../../common/widget/floatingactionbutton/fabs/boards_fab.dart';
import '../../common/widget/floatingactionbutton/fabs/things_fab.dart';
import '../../common/widget/floatingactionbutton/fabs/users_fab.dart';
import '../../common/widget/flutter_lazy_indexed_stack.dart';
import '../../common/widget/header.dart';
import '../../common/widget/side_menu.dart';
import '../../settings/view/settingsview.dart';
import '../../things/view/thingsview.dart';
import '../../things/view/thingsviewaddactionview.dart';
import '../../users/locationstab/view/locationaddactionview.dart';
import '../../users/notifier/users_notifier.dart';
import '../../users/rolestab/view/roleaddactionview.dart';
import '../../users/userstab/view/useraddactionview.dart';
import '../../users/view/usersview.dart';
import '../repository/state_home.dart';
import 'animated_floating_action_button.dart';
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
                        children: [
                          BoardsView(),
                          ThingsView(),
                          Container(),
                          UsersView(),
                          Container(),
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
      floatingActionButton:
          ref.watch(floatButtonProvider) == "BoardsViewDelete" || ref.watch(floatButtonProvider) == "BoardsViewEdit"
              ? FloatingActionButton(
                  backgroundColor: ref.watch(colorProvider)['accentColor'],
                  onPressed: () {
                    // 添加你的点击事件处理逻辑
                    ref.read(floatButtonProvider.notifier).change("");
                    //清除选中的widget
                    ref.read(selectedWidgetProvider.notifier).setWidget(null);
                  },
                  child: Icon(Icons.done, color: ref.watch(colorProvider)['white'], size: 30.h),
                )
              : ref.watch(indexHomeProvider) == 1
                  ? FloatingActionButton(
                      backgroundColor: ref.watch(colorProvider)['accentColor'],
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
                      child: Icon(Icons.add, color: ref.watch(colorProvider)['white'], size: 30.h),
                    )
                  : ref.watch(indexHomeProvider) == 3
                      ? FloatingActionButton(
                          backgroundColor: ref.watch(colorProvider)['accentColor'],
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
                          child: Icon(Icons.add, color: ref.watch(colorProvider)['white'], size: 30.h),
                        )
                      : AnimatedFloatingActionButton(
                          key: widget.key,
                          fabButtons: ref.watch(indexHomeProvider) == 0
                              ? getBoardsFabButtons(ref)
                              : ref.watch(indexHomeProvider) == 1
                                  ? getThingsFabButtons(ref)
                                  : ref.watch(indexHomeProvider) == 2
                                      ? getBoardsFabButtons(ref)
                                      : ref.watch(indexHomeProvider) == 3
                                          ? getUsersFabButtons(ref)
                                          : ref.watch(indexHomeProvider) == 4
                                              ? getBoardsFabButtons(ref)
                                              : ref.watch(indexHomeProvider) == 5
                                                  ? getBoardsFabButtons(ref)
                                                  : getBoardsFabButtons(ref),
                          colorStartAnimation: ref.watch(colorProvider)['accentColor']!,
                          colorEndAnimation: Colors.red,
                          colorStart: ref.watch(colorProvider)['white']!,
                          colorEnd: ref.watch(colorProvider)['white']!,
                          animatedIconData: AnimatedIcons.menu_close,
                          durationAnimation: 100,
                          tooltip: "Menu",
                          heroTag: "HOMEVIEW",
                          onFabToggle: (bool) {
                            LoggerManager().d("onFabToggle $bool");
                          },
                        ),
      floatingActionButtonLocation: ref.watch(indexHomeProvider) == 0
          ? ref.watch(boardsIndexProvider) == 0
              ? CustomFloatingActionButtonLocation(-100, -100)
              : CustomFloatingActionButtonLocation(ref.watch(floatButtonRestoreProvider) ? 620.w : 20.w, 0)
          : ref.watch(indexHomeProvider) == 1
              ? null
              : ref.watch(indexHomeProvider) == 2
                  ? CustomFloatingActionButtonLocation(-100, -100)
                  : ref.watch(indexHomeProvider) == 3
                      ? null
                      : ref.watch(indexHomeProvider) == 4
                          ? CustomFloatingActionButtonLocation(-100, -100)
                          : ref.watch(indexHomeProvider) == 5
                              ? CustomFloatingActionButtonLocation(-100, -100)
                              : CustomFloatingActionButtonLocation(
                                  ref.watch(floatButtonRestoreProvider) ? 620.w : 20.w, 0),
      floatingActionButtonAnimator: NoAnimationFloatingActionButtonAnimator(),
    );
  }
}
