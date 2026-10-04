//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_lister_app/screens/teams.dart';

void main() {
  testWidgets("teams page displays no teams when none exist", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Teams()));

    await tester.pumpAndSettle();

    //looking for prompt to add a team
    expect(find.text('Press   +   to Create Your First Team!'), findsOneWidget);
  });
}
