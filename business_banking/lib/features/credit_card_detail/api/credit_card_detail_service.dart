import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'credit_card_detail_service_response_model.dart';

class CreditCardDetailService extends EitherService<JsonRequestModel, CreditCardDetailServiceResponseModel> {
  CreditCardDetailService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'credit-card-details',
        );

  @override
  CreditCardDetailServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return CreditCardDetailServiceResponseModel.fromJson(jsonResponse);
  }
}
