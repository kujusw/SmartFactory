import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../http/boardstab.dart';
import '../../../../models/boards_tab_model.dart';

class BoardsTabDeleteHttpManager extends StateNotifier<DeleteBoardsTabResponseEntity> {
  BoardsTabDeleteHttpManager(super.state);
  Future<bool> deleteBoardsTab(params, token) async {
    try {
      DeleteBoardsTabResponseEntity result = await BoardsTabAPI.deleteBoardsTab(id: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = DeleteBoardsTabResponseEntity(code: 201, message: "Delete User failed");
      return false;
    }
  }
}
