import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_evencir/core/constants/app_assets.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({super.key, this.initialDate, this.onDateSelected});

  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDateSelected;

  static Future<void> show(
    BuildContext context, {
    DateTime? initialDate,
    ValueChanged<DateTime>? onDateSelected,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      builder: (context) => CalendarBottomSheet(
        initialDate: initialDate,
        onDateSelected: onDateSelected,
      ),
    );
  }

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  static const _weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  late DateTime _visibleMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialDate ?? DateTime.now();
    _selectedDate = DateTime(initial.year, initial.month, initial.day);
    _visibleMonth = DateTime(initial.year, initial.month);
  }

  void _changeMonth(int offset) {
    setState(() {
      _visibleMonth = DateTime(
        _visibleMonth.year,
        _visibleMonth.month + offset,
      );
    });
  }

  void _selectDate(DateTime date) {
    setState(() => _selectedDate = date);
    widget.onDateSelected?.call(date);
    Navigator.of(context).pop();
  }

  String get _monthTitle =>
      '${_months[_visibleMonth.month - 1]} ${_visibleMonth.year}';

  int get _daysInMonth =>
      DateTime(_visibleMonth.year, _visibleMonth.month + 1, 0).day;

  int get _firstWeekdayOffset {
    final firstDay = DateTime(_visibleMonth.year, _visibleMonth.month, 1);
    return (firstDay.weekday - DateTime.monday) % 7;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final totalCells = _firstWeekdayOffset + _daysInMonth;
    final rowCount = (totalCells / 7).ceil();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: const BoxDecoration(
        color: AppColors.primaryGrey,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 58,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.sheetHandle,
                borderRadius: BorderRadius.circular(10.53),
              ),
            ),
            24.heightBox,
            Row(
              children: [
                _MonthArrow(
                  side: _ArrowSide.left,
                  onTap: () => _changeMonth(-1),
                ),
                Expanded(
                  child: Text(
                    _monthTitle,
                    textAlign: TextAlign.center,
                    style: theme.bold14.copyWith(fontSize: 16),
                  ),
                ),
                _MonthArrow(
                  side: _ArrowSide.right,
                  onTap: () => _changeMonth(1),
                ),
              ],
            ),
            24.heightBox,
            Row(
              children: _weekdays
                  .map(
                    (day) => Expanded(
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: theme.bold14,
                      ),
                    ),
                  )
                  .toList(),
            ),
            16.heightBox,
            Column(
              children: List.generate(rowCount, (rowIndex) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: List.generate(7, (columnIndex) {
                      final cellIndex = rowIndex * 7 + columnIndex;
                      final dayNumber = cellIndex - _firstWeekdayOffset + 1;

                      if (dayNumber < 1 || dayNumber > _daysInMonth) {
                        return const Expanded(child: SizedBox(height: 44));
                      }

                      final date = DateTime(
                        _visibleMonth.year,
                        _visibleMonth.month,
                        dayNumber,
                      );
                      final isSelected =
                          _selectedDate.year == date.year &&
                          _selectedDate.month == date.month &&
                          _selectedDate.day == date.day;

                      return Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDate(date),
                          behavior: HitTestBehavior.opaque,
                          child: SizedBox(
                            height: 44,
                            child: Center(
                              child: Container(
                                width: 36,
                                height: 36,
                                alignment: Alignment.center,
                                decoration: isSelected
                                    ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primaryGreen
                                            .withValues(alpha: 0.2),
                                        border: Border.all(
                                          color: AppColors.primaryGreen,
                                          width: 2,
                                        ),
                                      )
                                    : null,
                                child: Text(
                                  '$dayNumber',
                                  style: theme.bold14.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

enum _ArrowSide { left, right }

class _MonthArrow extends StatelessWidget {
  const _MonthArrow({required this.side, required this.onTap});

  final _ArrowSide side;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Transform.flip(
          flipX: side == _ArrowSide.left,
          child: SvgPicture.asset(AppAssets.arrow, width: 18, height: 18),
        ),
      ),
    );
  }
}
