import 'dart:convert';

class BoardsTabResponseEntity {
  final int? code;
  final List<BoardsTabModel>? data;
  final String? message;

  BoardsTabResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  BoardsTabResponseEntity copyWith({
    int? code,
    List<BoardsTabModel>? data,
    String? message,
  }) =>
      BoardsTabResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory BoardsTabResponseEntity.fromRawJson(String str) => BoardsTabResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsTabResponseEntity.fromJson(Map<String, dynamic> json) => BoardsTabResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data")
            ? List<BoardsTabModel>.from(json["data"].map((x) => BoardsTabModel.fromJson(x)))
            : [],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BoardsTabModel {
  final int? id;
  final int? locationId;
  final int? position;
  final String? name;

  BoardsTabModel({
    this.id,
    this.locationId,
    this.position,
    this.name,
  });

  BoardsTabModel copyWith({
    int? id,
    int? locationId,
    int? position,
    String? name,
  }) =>
      BoardsTabModel(
        id: id ?? this.id,
        locationId: locationId ?? this.locationId,
        position: position ?? this.position,
        name: name ?? this.name,
      );

  factory BoardsTabModel.fromRawJson(String str) => BoardsTabModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsTabModel.fromJson(Map<String, dynamic> json) => BoardsTabModel(
        id: json.containsKey("id") ? json["id"] : 0,
        locationId: json.containsKey("location_id") ? json["location_id"] : 0,
        position: json.containsKey("position") ? json["position"] : 0,
        name: json.containsKey("name") ? json["name"] : "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location_id": locationId,
        "position": position,
        "name": name,
      };
  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AddBoardsTabRequestEntity {
  final String? name;
  final int? locationId;

  AddBoardsTabRequestEntity({
    this.name,
    this.locationId,
  });

  AddBoardsTabRequestEntity copyWith({
    String? name,
    int? locationId,
  }) =>
      AddBoardsTabRequestEntity(
        name: name ?? this.name,
        locationId: locationId ?? this.locationId,
      );

  factory AddBoardsTabRequestEntity.fromRawJson(String str) => AddBoardsTabRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddBoardsTabRequestEntity.fromJson(Map<String, dynamic> json) => AddBoardsTabRequestEntity(
        name: json.containsKey("name") ? json["name"] : "",
        locationId: json.containsKey("location_id") ? json["location_id"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location_id": locationId,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AddBoardsTabResponseEntity {
  final int? code;
  final BoardsTabModel? data;
  final String? message;

  AddBoardsTabResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  AddBoardsTabResponseEntity copyWith({
    int? code,
    BoardsTabModel? data,
    String? message,
  }) =>
      AddBoardsTabResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AddBoardsTabResponseEntity.fromRawJson(String str) => AddBoardsTabResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddBoardsTabResponseEntity.fromJson(Map<String, dynamic> json) => AddBoardsTabResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? BoardsTabModel.fromJson(json["data"]) : null,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class DeleteBoardsTabResponseEntity {
  final int? code;
  final BoardsTabId? data;
  final String? message;

  DeleteBoardsTabResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  DeleteBoardsTabResponseEntity copyWith({
    int? code,
    BoardsTabId? data,
    String? message,
  }) =>
      DeleteBoardsTabResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory DeleteBoardsTabResponseEntity.fromRawJson(String str) =>
      DeleteBoardsTabResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteBoardsTabResponseEntity.fromJson(Map<String, dynamic> json) => DeleteBoardsTabResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? BoardsTabId.fromJson(json["data"]) : null,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BoardsTabId {
  final int? id;

  BoardsTabId({
    this.id,
  });

  BoardsTabId copyWith({
    int? id,
  }) =>
      BoardsTabId(
        id: id ?? this.id,
      );

  factory BoardsTabId.fromRawJson(String str) => BoardsTabId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsTabId.fromJson(Map<String, dynamic> json) => BoardsTabId(
        id: json.containsKey("id") ? json["id"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BoardsWidgetResponseEntity {
  final int? code;
  final List<BoardsChartWidgetModel>? data;
  final String? message;

  BoardsWidgetResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  BoardsWidgetResponseEntity copyWith({
    int? code,
    List<BoardsChartWidgetModel>? data,
    String? message,
  }) =>
      BoardsWidgetResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory BoardsWidgetResponseEntity.fromRawJson(String str) => BoardsWidgetResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsWidgetResponseEntity.fromJson(Map<String, dynamic> json) => BoardsWidgetResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data")
            ? List<BoardsChartWidgetModel>.from(json["data"].map((x) => BoardsChartWidgetModel.fromJson(x)))
            : [],
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BoardsChartWidgetModel {
  final String? backgroundColor;
  int? boardId;
  final String? chartType;
  String? createdAt;
  String? description;
  final String? status;
  final String? deviceId;
  final String? deviceName;
  final String? fontColor;
  final int? fontSize;
  int? height;
  int? id;
  final bool? isOnline;
  final bool? isShowConnectedStatus;
  final int? position_x;
  final int? position_y;
  final String? reading;
  final String? title;
  final String? type;
  final String? updatedAt;
  int? width;
  final String? period;

  BoardsChartWidgetModel({
    this.backgroundColor,
    this.boardId,
    this.chartType,
    this.createdAt,
    this.description,
    this.status,
    this.deviceId,
    this.deviceName,
    this.fontColor,
    this.fontSize,
    this.height,
    this.id,
    this.isOnline,
    this.isShowConnectedStatus,
    this.position_x,
    this.position_y,
    this.reading,
    this.title,
    this.type,
    this.updatedAt,
    this.width,
    this.period,
  });

  BoardsChartWidgetModel copyWith({
    String? backgroundColor,
    int? boardId,
    String? chartType,
    String? createdAt,
    String? description,
    String? status,
    String? deviceId,
    String? deviceName,
    String? fontColor,
    int? fontSize,
    int? height,
    int? id,
    bool? isOnline,
    bool? isShowConnectedStatus,
    int? position,
    int? position_x,
    int? position_y,
    String? reading,
    String? title,
    String? type,
    String? updatedAt,
    int? width,
    String? period,
  }) =>
      BoardsChartWidgetModel(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        boardId: boardId ?? this.boardId,
        chartType: chartType ?? this.chartType,
        createdAt: createdAt ?? this.createdAt,
        description: description ?? this.description,
        deviceId: deviceId ?? this.deviceId,
        deviceName: deviceName ?? this.deviceName,
        fontColor: fontColor ?? this.fontColor,
        fontSize: fontSize ?? this.fontSize,
        height: height ?? this.height,
        id: id ?? this.id,
        isOnline: isOnline ?? this.isOnline,
        isShowConnectedStatus: isShowConnectedStatus ?? this.isShowConnectedStatus,
        position_x: position_x ?? this.position_x,
        position_y: position_y ?? this.position_y,
        reading: reading ?? this.reading,
        title: title ?? this.title,
        type: type ?? this.type,
        updatedAt: updatedAt ?? this.updatedAt,
        width: width ?? this.width,
        period: period ?? this.period,
      );

  factory BoardsChartWidgetModel.fromRawJson(String str) => BoardsChartWidgetModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsChartWidgetModel.fromJson(Map<String, dynamic> json) => BoardsChartWidgetModel(
        backgroundColor: json.containsKey("background_color") ? json["background_color"] : "",
        boardId: json.containsKey("board_id") ? json["board_id"] : 0,
        chartType: json.containsKey("chart_type") ? json["chart_type"] : "",
        createdAt: json.containsKey("created_at") ? json["created_at"] : "",
        description: json.containsKey("description") ? json["description"] : "",
        deviceId: json.containsKey("device_id") ? json["device_id"] : "",
        deviceName: json.containsKey("device_name") ? json["device_name"] : "",
        fontColor: json.containsKey("font_color") ? json["font_color"] : "",
        fontSize: json.containsKey("font_size") ? (json["font_size"] ?? 0) : 0,
        height: json.containsKey("height") ? (json["height"] ?? 0) : 0,
        id: json.containsKey("id") ? json["id"] : 0,
        isOnline: json.containsKey("is_online") ? json["is_online"] : false,
        isShowConnectedStatus: json.containsKey("is_show_connected_status") ? json["is_show_connected_status"] : false,
        position_x: json.containsKey("position_x") ? json["position_x"] : 0,
        position_y: json.containsKey("position_y") ? json["position_y"] : 0,
        reading: json.containsKey("reading") ? json["reading"] : "",
        title: json.containsKey("title") ? json["title"] : "",
        type: json.containsKey("type") ? json["type"] : "",
        updatedAt: json.containsKey("updated_at") ? json["updated_at"] : "",
        width: json.containsKey("width") ? (json["width"] ?? 0) : 0,
        period: json.containsKey("period") ? json["period"] : "",
      );

  Map<String, dynamic> toJson() => {
        "background_color": backgroundColor,
        "board_id": boardId,
        "chart_type": chartType,
        "created_at": createdAt,
        "description": description,
        "device_id": deviceId,
        "device_name": deviceName,
        "font_color": fontColor,
        "font_size": fontSize,
        "height": height,
        "id": id,
        "is_online": isOnline,
        "is_show_connected_status": isShowConnectedStatus,
        "position_x": position_x,
        "position_y": position_y,
        "reading": reading,
        "title": title,
        "type": type,
        "updated_at": updatedAt,
        "width": width,
        "period": period,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoardsChartWidgetModel &&
        other.backgroundColor == backgroundColor &&
        other.boardId == boardId &&
        other.chartType == chartType &&
        other.createdAt == createdAt &&
        other.description == description &&
        other.status == status &&
        other.deviceId == deviceId &&
        other.deviceName == deviceName &&
        other.fontColor == fontColor &&
        other.fontSize == fontSize &&
        other.height == height &&
        other.id == id &&
        other.isOnline == isOnline &&
        other.isShowConnectedStatus == isShowConnectedStatus &&
        other.position_x == position_x &&
        other.position_y == position_y &&
        other.reading == reading &&
        other.title == title &&
        other.type == type &&
        other.updatedAt == updatedAt &&
        other.width == width &&
        other.period == period;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class AddBoardsWidgetResponseEntity {
  final int? code;
  final BoardsWidgetId? data;
  final String? message;

  AddBoardsWidgetResponseEntity({
    this.code,
    this.data,
    this.message,
  });

  AddBoardsWidgetResponseEntity copyWith({
    int? code,
    BoardsWidgetId? data,
    String? message,
  }) =>
      AddBoardsWidgetResponseEntity(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AddBoardsWidgetResponseEntity.fromRawJson(String str) =>
      AddBoardsWidgetResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddBoardsWidgetResponseEntity.fromJson(Map<String, dynamic> json) => AddBoardsWidgetResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        data: json.containsKey("data") ? BoardsWidgetId.fromJson(json["data"]) : null,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BoardsWidgetId {
  int? widgetId;

  BoardsWidgetId({
    this.widgetId,
  });

  BoardsWidgetId copyWith({
    int? widgetId,
  }) =>
      BoardsWidgetId(
        widgetId: widgetId ?? this.widgetId,
      );

  factory BoardsWidgetId.fromRawJson(String str) => BoardsWidgetId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsWidgetId.fromJson(Map<String, dynamic> json) => BoardsWidgetId(
        widgetId: json.containsKey("widget_id") ? json["widget_id"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "widget_id": widgetId,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class DeleteBoardsWidgetResponseEntity {
  final int? code;
  final String? message;

  DeleteBoardsWidgetResponseEntity({
    this.code,
    this.message,
  });

  DeleteBoardsWidgetResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      DeleteBoardsWidgetResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory DeleteBoardsWidgetResponseEntity.fromRawJson(String str) =>
      DeleteBoardsWidgetResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteBoardsWidgetResponseEntity.fromJson(Map<String, dynamic> json) => DeleteBoardsWidgetResponseEntity(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BoardsWidgetOffsetRequestEntity {
  final List<BoardsWidget>? widgets;

  BoardsWidgetOffsetRequestEntity({
    this.widgets,
  });

  BoardsWidgetOffsetRequestEntity copyWith({
    List<BoardsWidget>? widgets,
  }) =>
      BoardsWidgetOffsetRequestEntity(
        widgets: widgets ?? this.widgets,
      );

  factory BoardsWidgetOffsetRequestEntity.fromRawJson(String str) =>
      BoardsWidgetOffsetRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsWidgetOffsetRequestEntity.fromJson(Map<String, dynamic> json) => BoardsWidgetOffsetRequestEntity(
        widgets: json.containsKey("widgets")
            ? List<BoardsWidget>.from(json["widgets"].map((x) => BoardsWidget.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "widgets": widgets == null ? [] : List<dynamic>.from(widgets!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BoardsWidget {
  final int? id;
  final int? position_x;
  final int? position_y;

  BoardsWidget({
    this.id,
    this.position_x,
    this.position_y,
  });

  BoardsWidget copyWith({
    int? id,
    int? position_x,
    int? position_y,
  }) =>
      BoardsWidget(
        id: id ?? this.id,
        position_x: position_x ?? this.position_x,
        position_y: position_y ?? this.position_y,
      );

  factory BoardsWidget.fromRawJson(String str) => BoardsWidget.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsWidget.fromJson(Map<String, dynamic> json) => BoardsWidget(
        id: json.containsKey("id") ? json["id"] : 0,
        position_x: json.containsKey("position_x") ? json["position_x"] : 0,
        position_y: json.containsKey("position_y") ? json["position_y"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "position_x": position_x,
        "position_y": position_y,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BoardsWidgetOffsetResponseEntity {
  final int? code;
  final String? message;

  BoardsWidgetOffsetResponseEntity({
    this.code,
    this.message,
  });

  BoardsWidgetOffsetResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      BoardsWidgetOffsetResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory BoardsWidgetOffsetResponseEntity.fromRawJson(String str) =>
      BoardsWidgetOffsetResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsWidgetOffsetResponseEntity.fromJson(Map<String, dynamic> json) => BoardsWidgetOffsetResponseEntity(
        code: json.containsKey("code") ? json["code"] : 0,
        message: json.containsKey("message") ? json["message"] : "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BoardsTabWidgetSortRequestEntity {
  final List<int>? boardIds;

  BoardsTabWidgetSortRequestEntity({
    this.boardIds,
  });

  BoardsTabWidgetSortRequestEntity copyWith({
    List<int>? boardIds,
  }) =>
      BoardsTabWidgetSortRequestEntity(
        boardIds: boardIds ?? this.boardIds,
      );

  factory BoardsTabWidgetSortRequestEntity.fromRawJson(String str) =>
      BoardsTabWidgetSortRequestEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsTabWidgetSortRequestEntity.fromJson(Map<String, dynamic> json) => BoardsTabWidgetSortRequestEntity(
        boardIds: json["board_ids"] == null ? [] : List<int>.from(json["board_ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "board_ids": boardIds == null ? [] : List<dynamic>.from(boardIds!.map((x) => x)),
      };
}

class BoardsTabWidgetSortResponseEntity {
  final int? code;
  final String? message;

  BoardsTabWidgetSortResponseEntity({
    this.code,
    this.message,
  });

  BoardsTabWidgetSortResponseEntity copyWith({
    int? code,
    String? message,
  }) =>
      BoardsTabWidgetSortResponseEntity(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory BoardsTabWidgetSortResponseEntity.fromRawJson(String str) =>
      BoardsTabWidgetSortResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoardsTabWidgetSortResponseEntity.fromJson(Map<String, dynamic> json) => BoardsTabWidgetSortResponseEntity(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };

  @override
  String toString() {
    return jsonEncode(this);
  }
}
