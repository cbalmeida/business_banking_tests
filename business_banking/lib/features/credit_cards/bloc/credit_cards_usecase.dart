import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../model/credit_cards_entity.dart';
import '../model/credit_cards_list_view_model.dart';
import 'credit_cards_service_adapter.dart';

class CreditCardsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  CreditCardsUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<CreditCardsEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<CreditCardsEntity>(CreditCardsEntity(), _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator().repository.runServiceAdapter(_scope, CreditCardsServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  CreditCardsViewModel buildViewModel(
    CreditCardsEntity creditCardsListEntityModel,
  ) {
    return CreditCardsViewModel(
      name: creditCardsListEntityModel.name,
      balance: creditCardsListEntityModel.balance,
      lastFour: creditCardsListEntityModel.lastFour,
    );
  }
}
