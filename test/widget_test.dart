import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_evencir/app.dart';
import 'package:test_task_evencir/core/utils/date_time_utils.dart';

void main() {
  testWidgets('Nutrition page renders key sections', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.text(DateTimeUtils.todayHeader), findsOneWidget);
    expect(find.text('Workouts'), findsOneWidget);
    expect(find.text('My Insights'), findsOneWidget);
    expect(find.text('Nutrition'), findsOneWidget);
    expect(find.text('Plan'), findsOneWidget);
    expect(find.text('Mood'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('Plan tab shows training calendar UI', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Plan'));
    await tester.pumpAndSettle();

    expect(find.text('Training Calendar'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
    expect(find.text('Week 2/8'), findsOneWidget);
    expect(find.text('December 8-14'), findsOneWidget);
    expect(find.text('Arm Blaster'), findsOneWidget);
    expect(find.text('Leg Day Blitz'), findsOneWidget);
    expect(find.text('Arms Workout'), findsOneWidget);
    expect(find.text('Leg Workout'), findsOneWidget);
  });

  testWidgets('Dropdown opens calendar bottom sheet', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    if (find.byKey(const Key('calendar_dropdown')).evaluate().isEmpty) {
      await tester.tap(find.text('Nutrition'));
      await tester.pumpAndSettle();
    }

    await tester.tap(find.byKey(const Key('calendar_dropdown')));
    await tester.pumpAndSettle();

    expect(find.text('MON'), findsOneWidget);
    expect(find.text('SUN'), findsOneWidget);
    expect(find.byType(GestureDetector), findsWidgets);
  });
}
