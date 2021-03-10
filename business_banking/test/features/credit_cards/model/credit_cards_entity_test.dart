import 'package:business_banking/features/credit_cards/model/credit_cards_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardsEntity properties', () {
    final entity = CreditCardsEntity(
      name: "Credit Card",
      lastFour: "0000",
      balance: 0.00,
    );
    expect(entity.name, "Credit Card");
    expect(entity.lastFour, "0000");
    expect(entity.balance, 0.0);

    expect(
      entity.toString(),
      'CreditCardsEntity([], Credit Card, 0000, 0.0)',
    );
  });

  test('CreditCardsEntity merge with errors = null', () {
    final entity = CreditCardsEntity(
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
