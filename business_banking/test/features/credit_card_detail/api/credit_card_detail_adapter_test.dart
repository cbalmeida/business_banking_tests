import 'package:business_banking/features/credit_card_detail/api/credit_card_detail_service_response_model.dart';
import 'package:business_banking/features/credit_card_detail/bloc/credit_card_detail_service_adapter.dart';
import 'package:business_banking/features/credit_card_detail/model/credit_card_detail_entity.dart';
import 'package:business_banking/features/credit_cards/model/credit_cards_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  
  test('Entity is created by service adapter', () {
    final entity = CreditCardDetailServiceAdapter().createEntity(
        CreditCardDetailEntity(),
        CreditCardDetailServiceResponseModel.fromJson({
          "name": "Credit Card",
          "lastFour": "0000",
          "balance": 0.00,
        }));

    expect(
        entity,
        CreditCardDetailEntity(
          name: "Credit Card",
          lastFour: "0000",
          balance: 0.00,
        ));
  });
}
