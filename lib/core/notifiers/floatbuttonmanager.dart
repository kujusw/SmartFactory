import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatButtonManager extends StateNotifier<String> {
  FloatButtonManager() : super("");

  void changeFloatButton(String value) {
    state = value;
  }

  void clearFloatButton() {
    state = "";
  }

  // Riverpod不允许直接更改Provider的值。相反，您应该创建一个新的StateNotifier实例，并将其分配给Provider，以触发UI的更新。
  // bool floatButtonMotion() {
  //   if (state == "BoardsViewAdd" || state == "BoardsViewEdit") {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
