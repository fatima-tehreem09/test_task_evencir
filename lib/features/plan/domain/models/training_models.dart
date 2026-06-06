import 'package:flutter/material.dart';
import 'package:test_task_evencir/core/constants/app_assets.dart';
import 'package:test_task_evencir/core/theme/colors.dart';

enum WorkoutCategory { arms, legs }

class TrainingWorkout {
  const TrainingWorkout({
    required this.title,
    required this.categoryLabel,
    required this.category,
    required this.duration,
  });

  final String title;
  final String categoryLabel;
  final WorkoutCategory category;
  final String duration;

  Color get tagBackground => switch (category) {
    WorkoutCategory.arms => AppColors.planArmsTagBackground,
    WorkoutCategory.legs => AppColors.planLegTagBackground,
  };

  Color get tagTextColor => switch (category) {
    WorkoutCategory.arms => AppColors.planArmsTagText,
    WorkoutCategory.legs => AppColors.planLegTagText,
  };

  String get tagIconAsset => switch (category) {
    WorkoutCategory.arms => AppAssets.arms,
    WorkoutCategory.legs => AppAssets.legs,
  };
}

class TrainingDay {
  const TrainingDay({required this.dayLabel, required this.date, this.workout});

  final String dayLabel;
  final int date;
  final TrainingWorkout? workout;

  bool get hasWorkout => workout != null;
}

class TrainingWeek {
  const TrainingWeek({
    required this.title,
    required this.dateRange,
    required this.totalDuration,
    required this.dividerColor,
    required this.days,
  });

  final String title;
  final String dateRange;
  final String totalDuration;
  final Color dividerColor;
  final List<TrainingDay> days;
}
