import 'package:clean_framework/clean_framework.dart';

import '../api/credit_card_detail_service.dart';
import '../model/credit_card_detail_view_model.dart';
import 'credit_card_detail_usecase.dart';

class CreditCardDetailBloc extends Bloc {
  CreditCardDetailUseCase _useCase;

  final creditCardDetailViewModelPipe = Pipe<CreditCardDetailViewModel>();

  @override
  void dispose() {
    creditCardDetailViewModelPipe.dispose();
  }

  CreditCardDetailBloc({CreditCardDetailService creditCardDetailService}) {
    _useCase = CreditCardDetailUseCase((viewModel) => creditCardDetailViewModelPipe.send(viewModel));
    creditCardDetailViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
