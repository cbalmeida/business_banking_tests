import 'package:business_banking/features/credit_card_detail/model/credit_card_detail_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardDetailEntity properties', () {
    final entity = CreditCardDetailEntity(
      name: "Credit Card",
      lastFour: "0000",
      balance: 0.00,
    );
    expect(entity.name, "Credit Card");
    expect(entity.lastFour, "0000");
    expect(entity.balance, 0.0);

    expect(
      entity.toString(),
      'CreditCardDetailEntity([], Credit Card, 0000, 0.0)',
    );
  });

  test('CreditCardDetailEntity merge with errors = null', () {
    final entity = CreditCardDetailEntity(
      name: "Credit Card",
      lastFour: "0000",
      balance: 0.0,
    );
    entity.merge(errors: null);
    expect(entity.name, "Credit Card");
    expect(entity.lastFour, "0000");
    expect(entity.balance, 0.0);
  });
}
