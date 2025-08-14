import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../http/boardstab.dart';
import '../../../../models/boards_tab_model.dart';

class BoardsWidgetDeleteHttpManager extends StateNotifier<DeleteBoardsWidgetResponseEntity> {
  BoardsWidgetDeleteHttpManager(super.state);
  Future<bool> deleteBoardsWidget(params, token) async {
    try {
      DeleteBoardsWidgetResponseEntity result = await BoardsTabAPI.deleteBoardsWidget(id: params, token: token);
      state = result;
      return true;
    } catch (e) {
      // 如果发生错误
      state = DeleteBoardsWidgetResponseEntity(code: 201, message: "Delete User failed");
      return false;
    }
  }
}
