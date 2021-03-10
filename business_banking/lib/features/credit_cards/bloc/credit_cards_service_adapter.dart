import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../locator.dart';
import '../api/credit_cards_service.dart';
import '../api/credit_cards_service_response_model.dart';
import '../model/credit_cards_entity.dart';

class CreditCardsServiceAdapter extends ServiceAdapter<CreditCardsEntity, JsonRequestModel, CreditCardsServiceResponseModel, CreditCardsService> {
  CreditCardsServiceAdapter() : super(CreditCardsService());

  @override
  CreditCardsEntity createEntity(CreditCardsEntity creditCardsEntityModelList, CreditCardsServiceResponseModel responseModel) {
    return creditCardsEntityModelList.merge(
      name: responseModel.name,
      balance: responseModel.balance,
      lastFour: responseModel.lastFour,
    );
  }
}
