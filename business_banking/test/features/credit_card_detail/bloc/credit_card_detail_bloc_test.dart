import 'package:business_banking/features/credit_card_detail/bloc/credit_card_detail_bloc.dart';
import 'package:business_banking/features/credit_card_detail/model/credit_card_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardDetailBloc gets creditCardDetail view model, real', () {
    final bloc = CreditCardDetailBloc();

    bloc.creditCardDetailViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CreditCardDetailViewModel>());
      expect(model.name, "VISA GOLD");
    }));
  });
}
