import 'package:test_task_evencir/core/constants/app_assets.dart';

abstract final class DateTimeUtils {
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

  static bool get isDayTime {
    final hour = DateTime.now().hour;
    return hour >= 6 && hour < 18;
  }

  static String get weatherIconAsset =>
      isDayTime ? AppAssets.bright : AppAssets.moon;

  static String get todayHeader {
    final now = DateTime.now();
    return formatDateHeader(now, prefix: 'Today');
  }

  static String formatDateHeader(DateTime date, {String? prefix}) {
    final label = '${date.day} ${_months[date.month - 1]} ${date.year}';
    return prefix != null ? '$prefix, $label' : label;
  }
}
