import 'package:business_banking/features/credit_cards/api/credit_cards_service_response_model.dart';
import 'package:business_banking/features/credit_cards/model/credit_cards_entity.dart';
import 'package:business_banking/features/credit_cards/model/credit_cards_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardsViewModel initialize', () {
    final viewModel = CreditCardsViewModel(
      name: "Credit Card",
      lastFour: "0000",
      balance: 0.00,
    );
    expect(viewModel.name, "Credit Card");

    expect(viewModel.props, [viewModel.name, viewModel.lastFour, viewModel.balance]);
  });
  test('CreditCardsViewModel initialize with error', () {
    try {
      CreditCardsViewModel();
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });

  test('CreditCardsViewModel initialize', () {
    final viewModel = CreditCardsServiceResponseModel.fromJson({
      "name": "Credit Card",
      "lastFour": "0000",
      "balance": 0.0,
    });
    expect(viewModel.name, "Credit Card");
    expect(viewModel.props, [
      viewModel.name,
      viewModel.lastFour,
      viewModel.balance,
    ]);
  });
}
