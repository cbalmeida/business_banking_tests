import 'package:business_banking/features/credit_card_payment/api/credit_card_payment_service_response_model.dart';
import 'package:business_banking/features/credit_card_payment/model/credit_card_payment_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentViewModel initialize', () {
    final viewModel = CreditCardPaymentViewModel(
      cardName: "Credit Card",
      cardLastFour: "0000",
      paymentValue: 0.0,
      paymentWasSuccessful: false,
      reasonPaymentNotSuccessful: "Unknown",
    );
    expect(viewModel.cardName, "Credit Card");

    expect(viewModel.props, [
      viewModel.cardName,
      viewModel.cardLastFour,
      viewModel.paymentValue,
      viewModel.paymentWasSuccessful,
      viewModel.reasonPaymentNotSuccessful,
    ]);
  });

  test('CreditCardPaymentViewModel initialize with error', () {
    try {
      CreditCardPaymentViewModel();
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });


  test('CreditCardPaymentViewModel initialize', () {
    final viewModel = CreditCardPaymentServiceResponseModel.fromJson({
      "cardName": "Credit Card",
      "cardLastFour": "0000",
      "paymentValue": 0.0,
      "paymentWasSuccessful": false,
      "reasonPaymentNotSuccessful": "Unknown",
    });
    expect(viewModel.cardName, "Credit Card");
    expect(viewModel.props, [
      viewModel.cardName,
      viewModel.cardLastFour,
      viewModel.paymentValue,
      viewModel.paymentWasSuccessful,
      viewModel.reasonPaymentNotSuccessful,
    ]);
  });
}
