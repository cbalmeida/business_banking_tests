import 'package:business_banking/features/credit_card_detail/api/credit_card_detail_service_response_model.dart';
import 'package:business_banking/features/credit_card_detail/model/credit_card_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardDetailViewModel initialize', () {
    final viewModel = CreditCardDetailViewModel(
      name: "Credit Card",
      lastFour: "0000",
      balance: 0.00,
    );
    expect(viewModel.name, "Credit Card");
    expect(viewModel.props, [viewModel.name, viewModel.lastFour, viewModel.balance]);
  });

  test('CreditCardDetailViewModel initialize with error', () {
    try {
      CreditCardDetailViewModel();
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });

  test('CreditCardDetailServiceResponseModel initialize', () {
    final viewModel = CreditCardDetailServiceResponseModel.fromJson({
      "name": "Credit Card",
      "lastFour": "0000",
      "balance": 0.00,
    });
    expect(viewModel.name, "Credit Card");
    expect(viewModel.props, [viewModel.name, viewModel.lastFour, viewModel.balance]);
  });
}
