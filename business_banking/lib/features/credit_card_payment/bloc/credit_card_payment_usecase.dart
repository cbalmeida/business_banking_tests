import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import '../model/credit_card_payment_entity.dart';
import '../model/credit_card_payment_view_model.dart';
import 'credit_card_payment_service_adapter.dart';

class CreditCardPaymentUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  CreditCardPaymentUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<CreditCardPaymentEntity>();
    if (_scope == null) {
      final newCreditCardPaymentEntity = CreditCardPaymentEntity();
      _scope = ExampleLocator().repository.create<CreditCardPaymentEntity>(newCreditCardPaymentEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator().repository.runServiceAdapter(_scope, CreditCardPaymentServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  CreditCardPaymentViewModel buildViewModel(CreditCardPaymentEntity entity) {
    return CreditCardPaymentViewModel(
      cardName: entity.cardName,
      cardLastFour: entity.cardLastFour,
      paymentValue: entity.paymentValue,
      paymentWasSuccessful: entity.paymentWasSuccessful,
      reasonPaymentNotSuccessful: entity.reasonPaymentNotSuccessful,
    );
  }
}
