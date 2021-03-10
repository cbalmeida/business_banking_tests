import 'package:business_banking/features/credit_card_payment/model/credit_card_payment_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentEntity properties', () {
    final entity = CreditCardPaymentEntity(
      cardName: "Credit Card",
      cardLastFour: "0000",
      paymentValue: 0.0,
      paymentWasSuccessful: false,
      reasonPaymentNotSuccessful: "Unknown",
    );
    expect(entity.cardName, "Credit Card");
    expect(entity.cardLastFour, "0000");
    expect(entity.paymentValue, 0.0);
    expect(entity.paymentWasSuccessful, false);
    expect(entity.reasonPaymentNotSuccessful, "Unknown");

    expect(
      entity.toString(),
      'CreditCardPaymentEntity([], Credit Card, 0000, 0.0, false, Unknown)',
    );
  });

  test('CreditCardPaymentEntity merge with errors = null', () {
    final entity = CreditCardPaymentEntity(
      cardName: "Credit Card",
      cardLastFour: "0000",
      paymentValue: 0.0,
      paymentWasSuccessful: false,
      reasonPaymentNotSuccessful: "Unknown",
    );
    entity.merge(errors: null);
    expect(entity.cardName, "Credit Card");
    expect(entity.cardLastFour, "0000");
    expect(entity.paymentValue, 0.0);
    expect(entity.paymentWasSuccessful, false);
    expect(entity.reasonPaymentNotSuccessful, "Unknown");
  });
}
