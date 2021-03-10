import 'package:business_banking/features/credit_card_detail/api/credit_card_detail_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardDetailService success', () async {
    final service = CreditCardDetailService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
  });


}
