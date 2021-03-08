import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../api/credit_card_payment_service.dart';
import '../api/credit_card_payment_service_response_model.dart';
import '../model/credit_card_payment_entity.dart';

class CreditCardPaymentServiceAdapter
    extends ServiceAdapter<CreditCardPaymentEntity, JsonRequestModel, CreditCardPaymentServiceResponseModel, CreditCardPaymentService> {
  CreditCardPaymentServiceAdapter() : super(CreditCardPaymentService());

  @override
  CreditCardPaymentEntity createEntity(CreditCardPaymentEntity initialEntity, CreditCardPaymentServiceResponseModel responseModel) {
    return CreditCardPaymentEntity(
      cardName: responseModel.cardName,
      cardLastFour: responseModel.cardLastFour,
      paymentValue: responseModel.paymentValue,
      paymentWasSuccessful: responseModel.paymentWasSuccessful,
      reasonPaymentNotSuccessful: responseModel.reasonPaymentNotSuccessful,
    );
  }
}
