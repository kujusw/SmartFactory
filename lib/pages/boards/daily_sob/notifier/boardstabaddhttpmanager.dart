import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../http/boardstab.dart';
import '../../../../models/boards_tab_model.dart';

class BoardsTabAddHttpManager extends StateNotifier<AddBoardsTabResponseEntity> {
  BoardsTabAddHttpManager(super.state);
  Future<bool> addBoardsTab(params, token) async {
    try {
      AddBoardsTabResponseEntity result = await BoardsTabAPI.addBoardsTab(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = AddBoardsTabResponseEntity(code: 201, message: "Add User failed");
      return false;
    }
  }
}
