import '../../models/boards_tab_model.dart';

String getReadingByWidgetReadingProviderInChart(String reading) {
  return reading == "Hourly Usage(Last 7 Days)"
      ? "energy_hourly"
      : reading == "Daily Usage(Last Week)"
          ? "energy_daily"
          : reading == "Daily Usage(This Month)"
              ? "energy_daily"
              : reading == "Monthly Usage(This Year)"
                  ? "energy_monthly"
                  : "";
}

String getPeriodByWidgetReadingProviderInChart(String reading) {
  return reading == "Hourly Usage(Last 7 Days)"
      ? "7d"
      : reading == "Daily Usage(Last Week)"
          ? "last_week"
          : reading == "Daily Usage(This Month)"
              ? "month"
              : reading == "Monthly Usage(This Year)"
                  ? "year"
                  : "";
}

String getReadingByBoardsChartWidgetModelInChart(BoardsChartWidgetModel? model) {
  return model?.reading == "energy_hourly" && model?.period == "7d"
      ? "Hourly Usage(Last 7 Days)"
      : model?.reading == "energy_daily" && model?.period == "last_week"
          ? "Daily Usage(Last Week)"
          : model?.reading == "energy_monthly" && model?.period == "month"
              ? "Monthly Usage(This Year)"
              : "";
}

String getReadingByBoardsChartWidgetModelInLastReadings(BoardsChartWidgetModel? model) {
  return model?.reading == "current"
      ? "Current"
      : model?.reading == "power"
          ? "Power"
          : model?.reading == "energy"
              ? "Energy"
              : model?.reading == "energy_hourly"
                  ? "Energy Hourly"
                  : model?.reading == "energy_daily"
                      ? "Energy Daily"
                      : model?.reading == "energy_weekly"
                          ? "Energy Weekly"
                          : model?.reading == "energy_monthly"
                              ? "Energy Monthly"
                              : model?.reading == "energy_weekly_diff"
                                  ? "Energy Weekly Diff"
                                  : "";
}

String getEnergyRequestType(BoardsChartWidgetModel parameter) {
  var type = "";
  if (parameter.reading == "energy_hourly") {
    type = "hourly";
  } else if (parameter.reading == "energy_daily") {
    type = "daily";
  } else if (parameter.reading == "energy_daily") {
    type = "daily";
  } else if (parameter.reading == "energy_monthly") {
    type = "monthly";
  }
  return type;
}

List<String> get getReadingsInChart {
  return const [
    "Hourly Usage(Last 7 Days)",
    "Daily Usage(Last Week)",
    "Daily Usage(This Month)",
    "Monthly Usage(This Year)"
  ];
}

List<String> get getReadingsInLastReadings {
  return const [
    "Current",
    "Power",
    "Energy",
    "Energy Hourly",
    "Energy Daily",
    "Energy Weekly",
    "Energy Monthly",
    "Energy Weekly Diff"
  ];
}

String getReadingByWidgetReadingProviderInLastReadings(String reading) {
  return reading == "Current"
      ? "current"
      : reading == "Power"
          ? "power"
          : reading == "Energy"
              ? "energy"
              : reading == "Energy Hourly"
                  ? "energy_hourly"
                  : reading == "Energy Daily"
                      ? "energy_daily"
                      : reading == "Energy Weekly"
                          ? "energy_weekly"
                          : reading == "Energy Monthly"
                              ? "energy_monthly"
                              : reading == "Energy Weekly Diff"
                                  ? "energy_weekly_diff"
                                  : "";
}
