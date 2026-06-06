import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_evencir/core/constants/app_assets.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/date_time_utils.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';

class WorkoutsSection extends StatelessWidget {
  const WorkoutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Workouts', style: theme.semiBold24),
            const Spacer(),
            SvgPicture.asset(
              DateTimeUtils.weatherIconAsset,
              width: 20,
              height: 20,
            ),
            12.widthBox,
            Text('9°', style: theme.medium24),
          ],
        ),
        24.heightBox,
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 88,
                decoration: BoxDecoration(
                  color: AppColors.primaryAquaBlue,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(14),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'December 22 - 25m - 30m',
                              style: theme.bold14.copyWith(fontSize: 12),
                            ),
                            8.heightBox,
                            Text(
                              'Upper Body',
                              style: theme.semiBold24.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(AppAssets.arrowRight),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
