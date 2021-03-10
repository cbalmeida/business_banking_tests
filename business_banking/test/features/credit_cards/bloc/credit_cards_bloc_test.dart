import 'package:business_banking/features/credit_cards/bloc/credit_cards_bloc.dart';
import 'package:business_banking/features/credit_cards/model/credit_cards_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardsBloc gets creditCards view model, real', () {
    final bloc = CreditCardsBloc();

    bloc.creditCardsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CreditCardsViewModel>());
      expect(model.name, "VISA GOLD");
    }));
  });
}
