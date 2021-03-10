import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'credit_cards_service_response_model.dart';

class CreditCardsService extends EitherService<JsonRequestModel, CreditCardsServiceResponseModel> {
  CreditCardsService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'credit-cards',
        );

  @override
  CreditCardsServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    /// Log JSON Response for Cash Accounts Service.
    return CreditCardsServiceResponseModel.fromJson(jsonResponse);
  }
}
