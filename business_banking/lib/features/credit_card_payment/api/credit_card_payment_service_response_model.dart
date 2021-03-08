import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class CreditCardPaymentServiceResponseModel extends Equatable implements JsonResponseModel {
  final String cardName;
  final String cardLastFour;
  final double paymentValue;
  final bool paymentWasSuccessful;
  final String reasonPaymentNotSuccessful;

  CreditCardPaymentServiceResponseModel.fromJson(Map<String, dynamic> json)
      : cardName = json['cardName'] ?? 'CreditCard',
        cardLastFour = json['cardLastFour'] ?? '0000',
        paymentValue = json['paymentValue'] ?? 0.00,
        paymentWasSuccessful = json['paymentWasSuccessful'] ?? false,
        reasonPaymentNotSuccessful = json['reasonPaymentNotSuccessful'] ?? "Unknown";

  @override
  List<Object> get props => [cardName, cardLastFour, paymentValue, paymentWasSuccessful, reasonPaymentNotSuccessful];
}
