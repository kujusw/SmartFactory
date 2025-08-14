import '../common/utils/logger_manager.dart';
import '../common/values/constant.dart';
import '../models/boards_tab_model.dart';
import 'http.dart';

class BoardsTabAPI {
  static Future<BoardsTabResponseEntity> getBoardsTabs({
    String? path,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).get(path!);
    LoggerManager().d("getBoardsTabs $response  ");
    return BoardsTabResponseEntity.fromJson(response);
  }

  static Future<AddBoardsTabResponseEntity> addBoardsTab({
    AddBoardsTabRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).post(
      "v1/boards",
      data: params?.toJson(),
    );
    LoggerManager().d("addBoardsTab $response  ");
    return AddBoardsTabResponseEntity.fromJson(response);
  }

  static Future<DeleteBoardsTabResponseEntity> deleteBoardsTab({
    int? id,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).delete("v1/boards/${id}");
    LoggerManager().d("deleteBoardsTab $response  ");
    return DeleteBoardsTabResponseEntity.fromJson(response);
  }

  static Future<BoardsWidgetResponseEntity> getBoardsWidgets({required String path, String? token}) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).get(path);
    LoggerManager().d("getBoardsWidgets $response  ");
    return BoardsWidgetResponseEntity.fromJson(response);
  }

  static Future<AddBoardsWidgetResponseEntity> addBoardsWidget({
    BoardsChartWidgetModel? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).post(
      "v1/boards/widgets",
      data: params?.toJson(),
    );
    LoggerManager().d("addBoardsWidget $response  ");
    return AddBoardsWidgetResponseEntity.fromJson(response);
  }

  static Future<AddBoardsWidgetResponseEntity> editBoardsWidget({
    BoardsChartWidgetModel? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).put(
      "v1/boards/widgets/${params?.id}",
      data: params?.toJson(),
    );
    LoggerManager().d("editBoardsWidget $response");
    return AddBoardsWidgetResponseEntity.fromJson(response);
  }

  static Future<DeleteBoardsWidgetResponseEntity> deleteBoardsWidget({
    int? id,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).delete("v1/boards/widgets/${id}");
    LoggerManager().d("deleteBoardsWidget $response");
    return DeleteBoardsWidgetResponseEntity.fromJson(response);
  }

  static Future<BoardsWidgetOffsetResponseEntity> editBoardsWidgetOffset({
    BoardsWidgetOffsetRequestEntity? params,
    int? boardId,
    String? token,
  }) async {
    LoggerManager().d("editBoardsWidgetOffset ${params.toString()}");
    var response = await HttpUtil(url: Constant.HOST, token: token).post(
      "v1/boards/$boardId/widgets/order",
      data: params?.toJson(),
    );
    LoggerManager().d("editBoardsWidgetOffset $response");
    return BoardsWidgetOffsetResponseEntity.fromJson(response);
  }

  static Future<BoardsTabWidgetSortResponseEntity> editBoardsTabWidgetSort({
    BoardsTabWidgetSortRequestEntity? params,
    String? token,
  }) async {
    var response = await HttpUtil(url: Constant.HOST, token: token).post(
      "v1/boards/order",
      data: params?.toJson(),
    );
    LoggerManager().d("editBoardsTabWidgetSort $response");
    return BoardsTabWidgetSortResponseEntity.fromJson(response);
  }
}
