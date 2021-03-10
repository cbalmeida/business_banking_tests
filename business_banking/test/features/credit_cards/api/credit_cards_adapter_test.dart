import 'package:business_banking/features/credit_cards/api/credit_cards_service_response_model.dart';
import 'package:business_banking/features/credit_cards/bloc/credit_cards_service_adapter.dart';
import 'package:business_banking/features/credit_cards/model/credit_cards_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = CreditCardsServiceAdapter().createEntity(
        CreditCardsEntity(),
        CreditCardsServiceResponseModel.fromJson({
          "name": "Credit Card",
          "lastFour": "0000",
          "balance": 0.00,
        }));

    expect(
        entity,
        CreditCardsEntity(
          name: "Credit Card",
          lastFour: "0000",
          balance: 0.00,
        ));
  });
}
