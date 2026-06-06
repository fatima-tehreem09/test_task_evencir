import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;
}

extension SizeExtension on num {
  SizedBox get heightBox => SizedBox(height: toDouble());

  SizedBox get widthBox => SizedBox(width: toDouble());
}

extension SliverExtension on Widget {
  Widget get sliver {
    return SliverToBoxAdapter(child: this);
  }
}

extension CenterExtension on Widget {
  Widget get centered {
    return Center(child: this);
  }
}

extension LeftExtension on Widget {
  Widget get left {
    return Align(alignment: Alignment.centerLeft, child: this);
  }
}

extension HorizontalPaddingExtension on Widget {
  Widget horizontalPadding(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String capitalizeWords() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}
