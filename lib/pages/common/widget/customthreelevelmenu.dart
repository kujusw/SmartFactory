import 'package:flutter/material.dart';

import '../../../common/utils/logger_manager.dart';

class CustomThreeLevelMenu extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final Widget Function(Map<String, dynamic> item) itemBuilder;
  final Widget Function(Map<String, dynamic> subItem) subItemBuilder;
  final Widget Function(Map<String, dynamic> subSubItem) subSubItemBuilder;

  CustomThreeLevelMenu({
    required this.data,
    required this.itemBuilder,
    required this.subItemBuilder,
    required this.subSubItemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: data.map((item) {
          return _buildExpansionTile(item);
        }).toList(),
      ),
    );
  }

  Widget _buildExpansionTile(Map<String, dynamic> item) {
    final title = itemBuilder(item);
    List<Widget> childrenList = [];
    if (item['children'] != null && item['children'] is List && item['children'].isNotEmpty) {
      List<Widget> children = (item['children'] as List<Map<String, dynamic>>).map((subItem) {
        return subItem['children'] != null && subItem['children'] is List
            ? _buildSubExpansionTile(subItem)
            : subItemBuilder(subItem);
      }).toList();
      childrenList.addAll(children);
    }
    return CustomExpansionTile(
      title: title,
      children: childrenList,
    );
  }

  Widget _buildSubExpansionTile(Map<String, dynamic> item) {
    final title = subItemBuilder(item);
    List<Widget> childrenList = [];
    if (item['children'] != null && item['children'] is List && item['children'].isNotEmpty) {
      List<Widget> children = (item['children'] as List<Map<String, dynamic>>).map((subItem) {
        return subItem['children'] != null && subItem['children'] is List
            ? _buildSubSubExpansionTile(subItem)
            : subSubItemBuilder(subItem);
      }).toList();
      childrenList.addAll(children);
    }
    return CustomExpansionTile(
      title: title,
      children: childrenList,
    );
  }

  Widget _buildSubSubExpansionTile(Map<String, dynamic> item) {
    final title = subSubItemBuilder(item);
    List<Widget> childrenList = [];
    if (item['children'] != null && item['children'] is List && item['children'].isNotEmpty) {
      List<Widget> children = (item['children'] as List<Map<String, dynamic>>).map((subItem) {
        return subItem['children'] != null && subItem['children'] is List
            ? subSubItemBuilder(subItem)
            : subSubItemBuilder(subItem);
      }).toList();
      childrenList.addAll(children);
    }
    return CustomExpansionTile(
      title: title,
      children: childrenList,
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;

  CustomExpansionTile({required this.title, required this.children});

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            LoggerManager().d("onTap children length: ${widget.children.length}");
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            color: Colors.transparent,
            child: widget.title,
          ),
        ),
        _isExpanded
            ? Column(
                children: widget.children,
              )
            : Container(),
      ],
    );
  }
}
