import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'credit_card_payment_service_response_model.dart';

class CreditCardPaymentService extends EitherService<JsonRequestModel, CreditCardPaymentServiceResponseModel> {
  CreditCardPaymentService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'credit-card-payment',
        );

  @override
  CreditCardPaymentServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return CreditCardPaymentServiceResponseModel.fromJson(jsonResponse);
  }
}
