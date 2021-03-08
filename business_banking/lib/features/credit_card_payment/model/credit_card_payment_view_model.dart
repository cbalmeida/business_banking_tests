import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CreditCardPaymentViewModel extends ViewModel {
  final String cardName;
  final String cardLastFour;
  final double paymentValue;
  final bool paymentWasSuccessful;
  final String reasonPaymentNotSuccessful;

  CreditCardPaymentViewModel({
    @required this.cardName,
    @required this.cardLastFour,
    @required this.paymentValue,
    @required this.paymentWasSuccessful,
    @required this.reasonPaymentNotSuccessful,
  }) : assert(cardName != null && cardLastFour != null && paymentValue != null && paymentWasSuccessful != null);

  @override
  List<Object> get props => [cardName, cardLastFour, paymentValue, paymentWasSuccessful, reasonPaymentNotSuccessful];
}
