import 'package:app_multi_screens/screens/nous_ecrire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Affiche le formulaire de contact',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: NousEcrire(),
        ),
      );

      expect(find.text('Nous ecrire'), findsOneWidget);

      expect(
        find.byType(TextFormField),
        findsNWidgets(4),
      );

      expect(
        find.text('Envoyer le message'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Affiche les erreurs lorsque le formulaire est vide',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: NousEcrire(),
        ),
      );

      await tester.tap(
        find.text('Envoyer le message'),
      );

      await tester.pump();

      expect(
        find.text('Veuillez entrer votre nom'),
        findsOneWidget,
      );

      expect(
        find.text('Veuillez entrer votre email'),
        findsOneWidget,
      );

      expect(
        find.text('Veuillez indiquer le sujet'),
        findsOneWidget,
      );

      expect(
        find.text('Veuillez écrire votre message'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Permet de saisir les informations',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: NousEcrire(),
        ),
      );

      final fields = find.byType(TextFormField);

      await tester.enterText(
        fields.at(0),
        'Abdoul',
      );

      await tester.enterText(
        fields.at(1),
        'abdoul@example.com',
      );

      await tester.enterText(
        fields.at(2),
        'Question',
      );

      await tester.enterText(
        fields.at(3),
        'Bonjour, je souhaite avoir plus d’informations.',
      );

      expect(
        find.text('Abdoul'),
        findsOneWidget,
      );

      expect(
        find.text('abdoul@example.com'),
        findsOneWidget,
      );
    },
  );
}