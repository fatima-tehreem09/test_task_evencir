import 'package:flutter/material.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';
import 'package:test_task_evencir/features/plan/domain/models/training_models.dart';
import 'package:test_task_evencir/features/plan/presentation/widgets/workout_plan_card.dart';

class TrainingDayRow extends StatelessWidget {
  const TrainingDayRow({
    required this.day,
    required this.dividerColor,
    super.key,
  });

  final TrainingDay day;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final hasWorkout = day.hasWorkout;
    final labelColor = hasWorkout
        ? AppColors.primaryWhite
        : AppColors.navInactive;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 36,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day.dayLabel,
                      style: theme.bold14.copyWith(
                        fontSize: 12,
                        color: labelColor,
                        fontWeight: hasWorkout
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                    4.heightBox,
                    Text(
                      '${day.date}',
                      style: theme.bold14.copyWith(
                        fontSize: 14,
                        color: labelColor,
                        fontWeight: hasWorkout
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              12.widthBox,
              Expanded(
                child: hasWorkout
                    ? WorkoutPlanCard(workout: day.workout!)
                    : SizedBox.shrink(),
              ),
            ],
          ),
          if (hasWorkout) ...[Divider(color: AppColors.dividerGrey)],
        ],
      ),
    );
  }
}
