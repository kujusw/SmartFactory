import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../http/boardstab.dart';
import '../../../../models/boards_tab_model.dart';

part 'boardswidgetdeletehttpmanager.g.dart';

@riverpod
class BoardsWidgetDelete extends _$BoardsWidgetDelete {
  @override
  DeleteBoardsWidgetResponseEntity build() {
    // 初始状态
    return DeleteBoardsWidgetResponseEntity(code: 0, message: "");
  }

  /// 删除 Boards Widget
  Future<bool> deleteBoardsWidget(dynamic id, String? token) async {
    try {
      final result = await BoardsTabAPI.deleteBoardsWidget(id: id, token: token);
      state = result;
      return true;
    } catch (e) {
      state = DeleteBoardsWidgetResponseEntity(code: 201, message: "Delete User failed");
      return false;
    }
  }
}
