import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/report_model.dart';

class ReportManager extends StateNotifier<List<ReportModel>> {
  ReportManager()
      : super(
          [],
        );

  void addReport(ReportModel reportModel) {
    state = [...state, reportModel];
  }
}
