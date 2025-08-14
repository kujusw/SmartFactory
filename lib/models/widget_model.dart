//总的widget model

//tab直接管理下面的数据结构 因为tab可以复制一栏 子widget可以在不同tab中同时存在 子widget应该单独管理
import 'dart:convert';

import 'boards_tab_model.dart';

class WidgetModel {
  int? id; //自增id
  BoardsTabModel? tab; //tab  比如属于哪个tab daily sob / daily nob
  String? type; //tab  比如属于哪个tab daily sob / daily nob
  int? subWidgetId; //子widget id

  WidgetModel({
    this.id,
    this.tab,
    this.type,
    this.subWidgetId,
  });

  factory WidgetModel.fromRawJson(String str) => WidgetModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WidgetModel.fromJson(Map<String, dynamic> json) => WidgetModel(
        id: json["id"],
        tab: json["tab"],
        type: json["type"],
        subWidgetId: json["subWidgetId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tab": tab,
        "type": type,
        "subWidgetId": subWidgetId,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}
