import 'package:business_banking/features/credit_cards/api/credit_cards_service.dart';
import 'package:business_banking/features/credit_cards/api/credit_cards_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardsService success', () async {
    final service = CreditCardsService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
  });
}
