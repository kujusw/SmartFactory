import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../http/boardstab.dart';
import '../../../../models/boards_tab_model.dart';

part 'boardswidgetaddhttpmanager.g.dart';

@riverpod
class BoardsWidgetAdd extends _$BoardsWidgetAdd {
  @override
  AddBoardsWidgetResponseEntity build() {
    // 初始状态
    return AddBoardsWidgetResponseEntity(code: 0, message: "");
  }

  /// 添加 Boards Widget
  Future<AddBoardsWidgetResponseEntity> addBoardsWidget(BoardsChartWidgetModel? params, String? token) async {
    try {
      final result = await BoardsTabAPI.addBoardsWidget(params: params, token: token);
      state = result;
      return result;
    } catch (e) {
      state = AddBoardsWidgetResponseEntity(code: 201, message: "Add Widget failed");
      return AddBoardsWidgetResponseEntity();
    }
  }

  /// 编辑 Boards Widget
  Future<AddBoardsWidgetResponseEntity> editBoardsWidget(BoardsChartWidgetModel? params, String? token) async {
    try {
      final result = await BoardsTabAPI.editBoardsWidget(params: params, token: token);
      state = result;
      return result;
    } catch (e) {
      state = AddBoardsWidgetResponseEntity(code: 201, message: "Edit Widget failed");
      return AddBoardsWidgetResponseEntity();
    }
  }
}
