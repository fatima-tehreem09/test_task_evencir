import 'package:flutter/material.dart';
import 'package:test_task_evencir/features/plan/domain/models/training_models.dart';
import 'package:test_task_evencir/features/plan/presentation/widgets/training_day_row.dart';

class TrainingWeekSection extends StatelessWidget {
  const TrainingWeekSection({required this.week, super.key});

  final TrainingWeek week;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...week.days.map(
          (day) => TrainingDayRow(day: day, dividerColor: week.dividerColor),
        ),
      ],
    );
  }
}
