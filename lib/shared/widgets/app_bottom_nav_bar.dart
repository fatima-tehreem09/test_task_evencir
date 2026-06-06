import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_evencir/core/constants/app_assets.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (icon: AppAssets.nutrition, label: 'Nutrition'),
    (icon: AppAssets.plan, label: 'Plan'),
    (icon: AppAssets.mood, label: 'Mood'),
    (icon: AppAssets.profile, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryBlack,
        border: Border(top: BorderSide(color: Color(0xff404040), width: 0.5)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 76,
          child: Row(
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final isSelected = currentIndex == index;
              final color = isSelected
                  ? AppColors.primaryWhite
                  : AppColors.navInactive;

              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        item.icon,
                        width: 22,
                        height: 22,
                        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                      ),
                      6.heightBox,
                      Text(
                        item.label,
                        style: theme.regular14.copyWith(color: color),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
