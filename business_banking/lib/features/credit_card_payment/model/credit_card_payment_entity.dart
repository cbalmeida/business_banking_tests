import 'package:clean_framework/clean_framework.dart';

class CreditCardPaymentEntity extends Entity {
  final String cardName;
  final String cardLastFour;
  final double paymentValue;
  final bool paymentWasSuccessful;
  final String reasonPaymentNotSuccessful;

  CreditCardPaymentEntity({
    List<EntityFailure> errors = const [],
    String cardName,
    String cardLastFour,
    double paymentValue,
    bool paymentWasSuccessful,
    String reasonPaymentNotSuccessful,
  })  : cardName = cardName ?? 'CreditCard',
        cardLastFour = cardLastFour ?? '0000',
        paymentValue = paymentValue ?? 0,
        paymentWasSuccessful = paymentWasSuccessful ?? false,
        reasonPaymentNotSuccessful = reasonPaymentNotSuccessful ?? "Unknown",
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        cardName,
        cardLastFour,
        paymentValue,
        paymentWasSuccessful,
        reasonPaymentNotSuccessful,
      ];

  @override
  CreditCardPaymentEntity merge(
      {errors, String cardName, String cardLastFour, double paymentValue, bool paymentWasSuccessful, String reasonPaymentNotSuccessful}) {
    return CreditCardPaymentEntity(
      errors: errors ?? this.errors,
      cardName: cardName ?? this.cardName,
      cardLastFour: cardLastFour ?? this.cardLastFour,
      paymentValue: paymentValue ?? this.paymentValue,
      paymentWasSuccessful: paymentWasSuccessful ?? this.paymentWasSuccessful,
      reasonPaymentNotSuccessful: reasonPaymentNotSuccessful ?? this.reasonPaymentNotSuccessful,
    );
  }
}
