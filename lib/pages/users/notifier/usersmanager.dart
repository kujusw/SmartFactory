import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user_manager_model.dart';

class UserManager extends StateNotifier<List<UserModel>> {
  UserManager() : super([]);

  void addUserManagerModel(UserModel userManagerModel) {
    state = [...state, userManagerModel];
  }
}
