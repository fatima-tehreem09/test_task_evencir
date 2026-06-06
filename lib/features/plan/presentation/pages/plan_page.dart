import 'package:flutter/material.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';
import 'package:test_task_evencir/features/plan/domain/models/training_models.dart';
import 'package:test_task_evencir/features/plan/presentation/widgets/training_week_section.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  static const _weeks = [
    TrainingWeek(
      title: 'Week 2/8',
      dateRange: 'December 8-14',
      totalDuration: 'Total: 60min',
      dividerColor: AppColors.planWeekDividerPurple,
      days: [
        TrainingDay(
          dayLabel: 'Mon',
          date: 8,
          workout: TrainingWorkout(
            title: 'Arm Blaster',
            categoryLabel: 'Arms Workout',
            category: WorkoutCategory.arms,
            duration: '25m - 30m',
          ),
        ),
        TrainingDay(dayLabel: 'Tue', date: 9),
        TrainingDay(dayLabel: 'Wed', date: 10),
        TrainingDay(
          dayLabel: 'Thu',
          date: 11,
          workout: TrainingWorkout(
            title: 'Leg Day Blitz',
            categoryLabel: 'Leg Workout',
            category: WorkoutCategory.legs,
            duration: '25m - 30m',
          ),
        ),
        TrainingDay(dayLabel: 'Fri', date: 12),
        TrainingDay(dayLabel: 'Sat', date: 13),
        TrainingDay(dayLabel: 'Sun', date: 14),
      ],
    ),
    TrainingWeek(
      title: 'Week 2',
      dateRange: 'December 14-22',
      totalDuration: 'Total: 60min',
      dividerColor: AppColors.primaryAquaBlue,
      days: [
        TrainingDay(dayLabel: 'Mon', date: 15),
        TrainingDay(dayLabel: 'Tue', date: 16),
        TrainingDay(dayLabel: 'Wed', date: 17),
        TrainingDay(dayLabel: 'Thu', date: 18),
        TrainingDay(dayLabel: 'Fri', date: 19),
        TrainingDay(dayLabel: 'Sat', date: 20),
        TrainingDay(dayLabel: 'Sun', date: 21),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.heightBox,
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Training Calendar',
                    style: theme.regular12.copyWith(fontSize: 24),
                  ),
                ),
                Text('Save', style: theme.bold14.copyWith(fontSize: 18)),
              ],
            ).horizontalPadding(24),
            40.heightBox,
            Container(
              height: 3,
              decoration: BoxDecoration(color: AppColors.planWeekDividerPurple),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
              decoration: BoxDecoration(color: Color(0xff121212)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Week 2/8',
                          style: theme.semiBold24.copyWith(fontSize: 18),
                        ),
                        4.heightBox,
                        Text(
                          'December 8-14',
                          style: theme.regular12.copyWith(
                            color: AppColors.primaryTextGreyLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Total: 60min",
                    style: theme.regular12.copyWith(
                      color: AppColors.primaryTextGreyLight,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            12.heightBox,
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                children: [
                  ..._weeks.map((week) => TrainingWeekSection(week: week)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
