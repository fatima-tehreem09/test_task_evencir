import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_evencir/core/constants/app_assets.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';
import 'package:test_task_evencir/features/plan/domain/models/training_models.dart';

class WorkoutPlanCard extends StatelessWidget {
  const WorkoutPlanCard({required this.workout, super.key});

  final TrainingWorkout workout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: const BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 12, 16, 12),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.weights),
                        8.widthBox,
                        _WorkoutTag(workout: workout),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          workout.title,
                          style: theme.regular14.copyWith(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                        Text(
                          workout.duration,
                          style: theme.regular14.copyWith(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkoutTag extends StatelessWidget {
  const _WorkoutTag({required this.workout});

  final TrainingWorkout workout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
        color: workout.tagBackground,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(workout.tagIconAsset, width: 10, height: 10),
          4.widthBox,
          Text(
            workout.categoryLabel,
            style: theme.semiBold24.copyWith(
              fontSize: 10,
              color: workout.tagTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
