import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../http/reports.dart';
import '../../../models/report_model.dart';
import '../../../models/reports_group_model.dart';
import '../../login/notifier/login_notifier.dart';
import 'reportsgroupsmanager.dart';
import 'reportsmanager.dart';
import 'reportuimanager.dart';

final itemsReportsGroupsProvider = StateNotifierProvider<ReportsGroupsManager, List<ReportsGroupsModel>>((ref) {
  return ReportsGroupsManager();
});

//原始数据
final itemsReportModelProvider = StateNotifierProvider<ReportManager, List<ReportModel>>((ref) {
  return ReportManager();
});

//过滤后的数据
final itemsReportModelFilteredProvider = StateNotifierProvider<ReportUIManager, List<ReportModel>>((ref) {
  return ReportUIManager(ref.read(itemsReportModelProvider));
});

Future<List<ReportModel>> getReports(FutureProviderRef<List<ReportModel>> ref) async {
  var reports = await ReportsAPI.getReports(path: "v1/reports", token: ref.read(loginProvider).data?.token);
  ref.read(itemsReportModelFilteredProvider.notifier).setReports(reports.data ?? []);
  return reports.data ?? [];
}

final getReportsProvider = FutureProvider<List<ReportModel>>((ref) async {
  return getReports(ref);
});

//搜索值
final vualeSearchProviderInReport = StateProvider.autoDispose<String>((ref) => "");

//退出登录后 清空数据
void clearReportsProvider(WidgetRef ref) {
  ref.invalidate(getReportsProvider);
  ref.invalidate(itemsReportModelProvider);
  ref.invalidate(itemsReportModelFilteredProvider);
  ref.invalidate(itemsReportsGroupsProvider);
  ref.invalidate(vualeSearchProviderInReport);
}
