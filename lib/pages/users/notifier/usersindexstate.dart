import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersIndexState extends StateNotifier<int> {
  UsersIndexState() : super(0);

  void setIndex(int index) {
    state = index;
  }
}
