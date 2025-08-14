import 'package:flutter/material.dart';

import 'generalviewglobalinfo.dart';
import 'generalviewsingleinfo.dart';

class GeneralView extends StatelessWidget {
  GeneralView({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [GeneralViewGlobalInfo(), GeneralViewSingleInfo()],
    );
  }
}
