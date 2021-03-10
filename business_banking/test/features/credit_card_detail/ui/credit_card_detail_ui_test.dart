import 'package:business_banking/features/credit_card_detail/bloc/credit_card_detail_bloc.dart';
import 'package:business_banking/features/credit_card_detail/ui/credit_card_detail_presenter.dart';
import 'package:business_banking/features/credit_card_detail/ui/credit_card_detail_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CreditCardDetailWidget, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<CreditCardDetailBloc>(
      child: CreditCardDetailWidget(),
      create: (_) => CreditCardDetailBloc(),
    ));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(CreditCardDetailPresenter), findsOneWidget);
  });
}
