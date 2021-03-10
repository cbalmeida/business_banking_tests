import 'package:business_banking/features/credit_card_payment/api/credit_card_payment_service_response_model.dart';
import 'package:business_banking/features/credit_card_payment/bloc/credit_card_payment_service_adapter.dart';
import 'package:business_banking/features/credit_card_payment/model/credit_card_payment_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = CreditCardPaymentServiceAdapter().createEntity(
        CreditCardPaymentEntity(),
        CreditCardPaymentServiceResponseModel.fromJson({
          "cardName": "Credit Card",
          "cardLastFour": "0000",
          "paymentValue": 0.0,
          "paymentWasSuccessful": false,
          "reasonPaymentNotSuccessful": "Unknown",
        }));

    expect(
      entity,
      CreditCardPaymentEntity(
        cardName: "Credit Card",
        cardLastFour: "0000",
        paymentValue: 0.0,
        paymentWasSuccessful: false,
        reasonPaymentNotSuccessful: "Unknown",
      ),
    );
  });
}
