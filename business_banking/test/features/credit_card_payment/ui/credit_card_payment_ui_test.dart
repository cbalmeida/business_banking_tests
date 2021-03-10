import 'package:business_banking/features/credit_card_payment/bloc/credit_card_payment_bloc.dart';
import 'package:business_banking/features/credit_card_payment/ui/credit_card_payment_presenter.dart';
import 'package:business_banking/features/credit_card_payment/ui/credit_card_payment_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CreditCardPaymentWidget, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<CreditCardPaymentBloc>(
      child: CreditCardPaymentWidget(),
      create: (_) => CreditCardPaymentBloc(),
    ));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(CreditCardPaymentPresenter), findsOneWidget);
  });
}
