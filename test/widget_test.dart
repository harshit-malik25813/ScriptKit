// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScriptKit/main.dart';

void main() {
  testWidgets('renders the homework formatter screen', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeworkApp());

    expect(find.text('Classwork & Homework Formatter'), findsOneWidget);
    expect(find.text('Class / Section'), findsOneWidget);
    expect(find.text('Date (DD/MM/YYYY)'), findsOneWidget);
    expect(find.text('Lecture 1'), findsOneWidget);
    expect(find.text('Generate'), findsOneWidget);
  });
}
