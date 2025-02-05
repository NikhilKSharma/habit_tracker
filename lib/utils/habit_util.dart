import 'package:habit_tracker/models/habit.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any((date) =>
      date.year == today.year &&
      date.month == today.month &&
      date.day == today.day);
}

//heatmap data set
Map<DateTime, int> prepHeatMapDataset(List<Habit> habits) {
  Map<DateTime, int> dataset = {};
  for (var habit in habits) {
    for (var date in habit.completedDays) {
      final normalizedData = DateTime(date.year, date.month, date.day);
      if (dataset.containsKey(normalizedData)) {
        dataset[normalizedData] = dataset[normalizedData]! + 1;
      } else {
        dataset[normalizedData] = 1;
      }
    }
  }
  return dataset;
}
