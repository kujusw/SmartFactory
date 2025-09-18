import '../../../../http/boardstab.dart';
import '../../../../models/boards_tab_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boardstabaddhttpmanager.g.dart';

@riverpod
class BoardsTabAdd extends _$BoardsTabAdd {
  @override
  AddBoardsTabResponseEntity build() {
    // 初始状态
    return AddBoardsTabResponseEntity(code: 0, message: "");
  }

  /// 添加 Boards Tab
  Future<bool> addBoardsTab(AddBoardsTabRequestEntity? params, String? token) async {
    try {
      final result = await BoardsTabAPI.addBoardsTab(params: params, token: token);
      state = result;
      return true;
    } catch (e) {
      state = AddBoardsTabResponseEntity(code: 201, message: "Add User failed");
      return false;
    }
  }
}
