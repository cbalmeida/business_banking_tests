import 'package:business_banking/features/credit_card_detail/bloc/credit_card_detail_usecase.dart';
import 'package:business_banking/features/credit_card_detail/model/credit_card_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardDetailUseCase initialize with error', () {
    try {
      CreditCardDetailUseCase(null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });

  test('CreditCardDetailUseCase initialize and create', () {
    final usecase = CreditCardDetailUseCase((viewModel) {
      expect(viewModel, isA<CreditCardDetailViewModel>());
    });
    usecase.create();
  });

  test('CreditCardDetailUseCase initialize and recreate', () {
    final usecase = CreditCardDetailUseCase((viewModel) {
      expect(viewModel, isA<CreditCardDetailViewModel>());
    });
    usecase.create();
    usecase.create(); //use to trigger else in the create
  });
}
