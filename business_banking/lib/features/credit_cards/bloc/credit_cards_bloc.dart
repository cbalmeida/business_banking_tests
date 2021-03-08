import 'package:clean_framework/clean_framework.dart';

import '../api/credit_cards_service.dart';
import '../model/credit_cards_list_view_model.dart';
import 'credit_cards_usecase.dart';

class CreditCardsBloc extends Bloc {
  CreditCardsUseCase _useCase;

  final creditCardsViewModelPipe = Pipe<CreditCardsViewModel>();

  @override
  void dispose() {
    creditCardsViewModelPipe.dispose();
  }

  CreditCardsBloc({CreditCardsService creditCardsService}) {
    _useCase = CreditCardsUseCase((viewModel) => creditCardsViewModelPipe.send(viewModel));
    creditCardsViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
