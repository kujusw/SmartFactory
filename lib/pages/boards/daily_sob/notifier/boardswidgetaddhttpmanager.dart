import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../http/boardstab.dart';
import '../../../../models/boards_tab_model.dart';

class BoardsWidgetAddHttpManager extends StateNotifier<AddBoardsWidgetResponseEntity> {
  BoardsWidgetAddHttpManager(super.state);
  Future<AddBoardsWidgetResponseEntity> addBoardsWidget(params, token) async {
    try {
      AddBoardsWidgetResponseEntity result = await BoardsTabAPI.addBoardsWidget(params: params, token: token);
      state = result;
      return result;
    } catch (e) {
      // 如果发生错误
      state = AddBoardsWidgetResponseEntity(code: 201, message: "Add Widget failed");
      return AddBoardsWidgetResponseEntity();
    }
  }

  Future<AddBoardsWidgetResponseEntity> editBoardsWidget(params, token) async {
    try {
      AddBoardsWidgetResponseEntity result = await BoardsTabAPI.editBoardsWidget(params: params, token: token);
      state = result;
      return result;
    } catch (e) {
      // 如果发生错误
      state = AddBoardsWidgetResponseEntity(code: 201, message: "Edit Widget failed");
      return AddBoardsWidgetResponseEntity();
    }
  }
}
