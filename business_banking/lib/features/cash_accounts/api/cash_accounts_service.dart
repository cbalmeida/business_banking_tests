import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'cash_accounts_service_response_model.dart';

class CashAccountsService
    extends EitherService<JsonRequestModel, CashAccountsServiceResponseModel> {
  final bool debugEnabled = false;

  CashAccountsService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'cash-accounts',
        );

  @override
  CashAccountsServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    /// Log JSON Response for Cash Accounts Service.
    /// ToDo() - Set Logging only to Dev environment
    if (debugEnabled) {
      logger().debug('CashAccountsService JSON: ' + jsonResponse.toString());
    }

    return CashAccountsServiceResponseModel.fromJson(jsonResponse);
  }
}
