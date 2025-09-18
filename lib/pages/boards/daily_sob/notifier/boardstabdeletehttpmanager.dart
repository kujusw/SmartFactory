import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../http/boardstab.dart';
import '../../../../models/boards_tab_model.dart';

part 'boardstabdeletehttpmanager.g.dart';

@riverpod
class BoardsTabDelete extends _$BoardsTabDelete {
  @override
  DeleteBoardsTabResponseEntity build() {
    // 初始状态
    return DeleteBoardsTabResponseEntity(code: 0, message: "");
  }

  /// 删除 Boards Tab
  Future<bool> deleteBoardsTab(dynamic id, String? token) async {
    try {
      final result = await BoardsTabAPI.deleteBoardsTab(id: id, token: token);
      state = result;
      return true;
    } catch (e) {
      state = DeleteBoardsTabResponseEntity(code: 201, message: "Delete User failed");
      return false;
    }
  }
}
