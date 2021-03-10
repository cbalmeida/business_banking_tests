import 'package:business_banking/features/credit_card_payment/bloc/credit_card_payment_bloc.dart';
import 'package:business_banking/features/credit_card_payment/model/credit_card_payment_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentBloc gets creditCardPayment view model, real', () {
    final bloc = CreditCardPaymentBloc();

    bloc.creditCardPaymentViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CreditCardPaymentViewModel>());
      expect(model.cardName, "VISA GOLD");
    }));
  });
}
