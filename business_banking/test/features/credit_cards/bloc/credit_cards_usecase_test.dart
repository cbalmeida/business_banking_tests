import 'package:business_banking/features/credit_cards/bloc/credit_cards_usecase.dart';
import 'package:business_banking/features/credit_cards/model/credit_cards_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardsUseCase initialize with error', () {
    try {
      CreditCardsUseCase(null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });

  test('CreditCardsUseCase initialize and create', () {
    final usecase = CreditCardsUseCase((viewModel) {
      expect(viewModel, isA<CreditCardsViewModel>());
    });
    usecase.create();
  });

  test('CreditCardsUseCase initialize and recreate', () {
    final usecase = CreditCardsUseCase((viewModel) {
      expect(viewModel, isA<CreditCardsViewModel>());
    });
    usecase.create();
    usecase.create(); //use to trigger else in the create
  });
}
