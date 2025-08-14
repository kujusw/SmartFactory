import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/report_model.dart';

class ReportUIManager extends StateNotifier<List<ReportModel>> {
  ReportUIManager(List<ReportModel> initialData) : super([]) {
    setReports(initialData);
  }

  void addReport(ReportModel reportModel) {
    state = [...state, reportModel];
  }

  void addReportList(List<ReportModel> reportModel) {
    state = [...state, ...reportModel];
  }

  void removeReport(ReportModel reportModel) {
    state = state.where((t) => t != reportModel).toList();
  }

  void removeReportList(List<ReportModel> reportModel) {
    state = state.where((t) => !reportModel.contains(t)).toList();
  }

  //通过id 更新
  void updateReport(ReportModel newReportModel) {
    state = state.map((t) => t.id == newReportModel.id ? newReportModel : t).toList();
  }

  //设置集合
  void setReports(List<ReportModel> reportModels) {
    state = reportModels; //这样写会有问题 hashcode一样 改变UI数据会影响到原始数据
    // state = reportModels.map((report) => ReportModel.copy(report)).toList();
  }

  //选中所有
  void selectAll(bool selected) {
    state = state
        .map((t) => ReportModel(
              id: t.id,
              name: t.name,
              type: t.type,
              createdAt: t.createdAt,
              selected: selected,
            ))
        .toList();
  }

  void clearReports() {
    state = [];
  }

  getSearchReports(String watch) {
    return state.where((element) {
      //忽略大小写
      return element.name!.toLowerCase().contains(watch.toLowerCase());
    }).toList();
  }
}
