import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user_role_model.dart';

class RoleManager extends StateNotifier<List<RoleModel>> {
  RoleManager() : super([]);

  void addRoleModel(RoleModel roleModel) {
    state = [...state, roleModel];
  }
}
