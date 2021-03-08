import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'credit_cards_service_response_model.dart';

class CreditCardsService extends EitherService<JsonRequestModel, CreditCardsServiceResponseModel> {
  final bool debugEnabled = false;

  CreditCardsService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'credit-cards',
        );

  @override
  CreditCardsServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    /// Log JSON Response for Cash Accounts Service.
    /// ToDo() - Set Logging only to Dev environment
    if (debugEnabled) {
      logger().debug('CreditCardsService JSON: ' + jsonResponse.toString());
    }

    return CreditCardsServiceResponseModel.fromJson(jsonResponse);
  }
}
