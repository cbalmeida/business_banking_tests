import 'package:clean_framework/clean_framework.dart';

import '../api/credit_card_payment_service.dart';
import '../model/credit_card_payment_view_model.dart';
import 'credit_card_payment_usecase.dart';

class CreditCardPaymentBloc extends Bloc {
  CreditCardPaymentUseCase _useCase;

  final creditCardPaymentViewModelPipe = Pipe<CreditCardPaymentViewModel>();

  @override
  void dispose() {
    creditCardPaymentViewModelPipe.dispose();
  }

  CreditCardPaymentBloc({CreditCardPaymentService creditCardPaymentService}) {
    _useCase = CreditCardPaymentUseCase((viewModel) => creditCardPaymentViewModelPipe.send(viewModel));
    creditCardPaymentViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
