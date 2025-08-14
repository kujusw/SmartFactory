import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/reports_group_model.dart';

class ReportsGroupsManager extends StateNotifier<List<ReportsGroupsModel>> {
  ReportsGroupsManager()
      : super(
          [
            ReportsGroupsModel(
              id: "1",
              name: 'Favorites',
              value: "10",
              description: "Smart Business",
              createdAt: "Feb 26 2024 4:45:00 PM",
              updatedAt: "Feb 26 2024 4:45:00 PM",
            ),
            ReportsGroupsModel(
              id: "2",
              name: 'Tenant Reports',
              value: "20",
              description: "Smart Business",
              createdAt: "Feb 26 2024 4:45:00 PM",
              updatedAt: "Feb 26 2024 4:45:00 PM",
            ),
            ReportsGroupsModel(
              id: "3",
              name: 'Application Reports',
              value: "30",
              description: "Smart Business",
              createdAt: "Feb 26 2024 4:45:00 PM",
              updatedAt: "Feb 26 2024 4:45:00 PM",
            ),
            ReportsGroupsModel(
              id: "4",
              name: 'My Reports',
              value: "40",
              description: "Smart Business",
              createdAt: "Feb 26 2024 4:45:00 PM",
              updatedAt: "Feb 26 2024 4:45:00 PM",
            ),
          ],
        );

  void addReportsGroups(ReportsGroupsModel reportsGroupsModel) {
    state = [...state, reportsGroupsModel];
  }

  void removeReportsGroups(ReportsGroupsModel reportsGroupsModel) {
    state = state.where((t) => t != reportsGroupsModel).toList();
  }

  //通过id 更新
  void updateReportsGroups(ReportsGroupsModel newReportsGroupsModel) {
    state = state.map((t) => t.id == newReportsGroupsModel.id ? newReportsGroupsModel : t).toList();
  }
}
