import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_evencir/core/constants/app_assets.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';

class NutritionTopBar extends StatelessWidget {
  const NutritionTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        SvgPicture.asset(AppAssets.bell),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.dayTrack),
            4.widthBox,
            Text('Week 1/4', style: theme.bold14),
            4.widthBox,
            SvgPicture.asset(AppAssets.dropdown),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
