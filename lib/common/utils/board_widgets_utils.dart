import '../../models/boards_tab_model.dart';
import '../../models/device_model.dart';

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

String getLastReadingsWidgetStatusValue(
    BoardsChartWidgetModel lastReadingsWidgetModel, DeviceEnergyResponseEntity deviceEnergyResponseEntity) {
  String status = "N/A";
  if (lastReadingsWidgetModel.reading == "current") {
    status = (deviceEnergyResponseEntity.data?.current ?? 0.0).toStringAsFixed(2) + " A";
  } else if (lastReadingsWidgetModel.reading == "power") {
    status = (deviceEnergyResponseEntity.data?.power ?? 0.0).toStringAsFixed(2) + " kW";
  } else if (lastReadingsWidgetModel.reading == "energy") {
    status = (deviceEnergyResponseEntity.data?.energy ?? 0.0).toStringAsFixed(2) + " kWh";
  } else if (lastReadingsWidgetModel.reading == "energy_hourly") {
    status = (deviceEnergyResponseEntity.data?.energyHourly ?? 0.0).toStringAsFixed(2) + " kWh";
  } else if (lastReadingsWidgetModel.reading == "energy_daily") {
    status = (deviceEnergyResponseEntity.data?.energyDaily ?? 0.0).toStringAsFixed(2) + " kWh";
  } else if (lastReadingsWidgetModel.reading == "energy_weekly") {
    status = (deviceEnergyResponseEntity.data?.energyWeekly ?? 0.0).toStringAsFixed(2) + " kWh";
  } else if (lastReadingsWidgetModel.reading == "energy_monthly") {
    status = (deviceEnergyResponseEntity.data?.energyMonthly ?? 0.0).toStringAsFixed(2) + " kWh";
  } else if (lastReadingsWidgetModel.reading == "energy_weekly_diff") {
    status = (deviceEnergyResponseEntity.data?.energyWeeklyDiff ?? 0.0).toStringAsFixed(2) + " kWh";
  }
  return status;
}

int getLastReadingsWidgetStatusTime(
    BoardsChartWidgetModel lastReadingsWidgetModel, DeviceEnergyResponseEntity deviceEnergyResponseEntity) {
  int time = 0;
  if (lastReadingsWidgetModel.reading == "current") {
    time = deviceEnergyResponseEntity.data?.timestamp ?? 0;
  } else if (lastReadingsWidgetModel.reading == "power") {
    time = deviceEnergyResponseEntity.data?.timestamp ?? 0;
  } else if (lastReadingsWidgetModel.reading == "energy") {
    time = deviceEnergyResponseEntity.data?.timestamp ?? 0;
  } else if (lastReadingsWidgetModel.reading == "energy_hourly") {
    time = deviceEnergyResponseEntity.data?.energyHourlyTimestamp ?? 0;
  } else if (lastReadingsWidgetModel.reading == "energy_daily") {
    time = deviceEnergyResponseEntity.data?.energyDailyTimestamp ?? 0;
  } else if (lastReadingsWidgetModel.reading == "energy_weekly") {
    time = deviceEnergyResponseEntity.data?.energyWeeklyTimestamp ?? 0;
  } else if (lastReadingsWidgetModel.reading == "energy_monthly") {
    time = deviceEnergyResponseEntity.data?.energyMonthlyTimestamp ?? 0;
  } else if (lastReadingsWidgetModel.reading == "energy_weekly_diff") {
    time = deviceEnergyResponseEntity.data?.energyWeeklyTimestamp ?? 0;
  }
  return time;
}
