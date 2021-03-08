import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import '../model/credit_card_detail_entity.dart';
import '../model/credit_card_detail_view_model.dart';
import 'credit_card_detail_service_adapter.dart';

class CreditCardDetailUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  CreditCardDetailUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<CreditCardDetailEntity>();
    if (_scope == null) {
      final newCreditCardDetailEntity = CreditCardDetailEntity();
      _scope = ExampleLocator().repository.create<CreditCardDetailEntity>(newCreditCardDetailEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator().repository.runServiceAdapter(_scope, CreditCardDetailServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  CreditCardDetailViewModel buildViewModel(CreditCardDetailEntity entity) {
    return CreditCardDetailViewModel(
      name: entity.name,
      lastFour: entity.lastFour,
      balance: entity.balance,
    );
  }
}
