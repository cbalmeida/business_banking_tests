import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../api/credit_card_detail_service.dart';
import '../api/credit_card_detail_service_response_model.dart';
import '../model/credit_card_detail_entity.dart';

class CreditCardDetailServiceAdapter
    extends ServiceAdapter<CreditCardDetailEntity, JsonRequestModel, CreditCardDetailServiceResponseModel, CreditCardDetailService> {
  CreditCardDetailServiceAdapter() : super(CreditCardDetailService());

  @override
  CreditCardDetailEntity createEntity(CreditCardDetailEntity initialEntity, CreditCardDetailServiceResponseModel responseModel) {
    return CreditCardDetailEntity(
      name: responseModel.name,
      lastFour: responseModel.lastFour,
      balance: responseModel.balance,
    );
  }
}
