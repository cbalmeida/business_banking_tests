import 'package:business_banking/features/credit_cards/bloc/credit_cards_bloc.dart';
import 'package:business_banking/features/credit_cards/ui/credit_cards_presenter.dart';
import 'package:business_banking/features/credit_cards/ui/credit_cards_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CreditCards Golden test', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<CreditCardsBloc>(
        create: (_) => CreditCardsBloc(),
        child: CreditCardsWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await expectLater(
      find.byType(CreditCardsPresenter),
      matchesGoldenFile('creditCardsGoldenTest.png'),
    );
  });
}
