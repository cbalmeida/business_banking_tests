import 'package:business_banking/features/credit_card_payment/api/credit_card_payment_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentService success', () async {
    final service = CreditCardPaymentService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
  });
}
