import 'package:clean_framework/clean_framework.dart';

class CreditCardDetailEntity extends Entity {
  final String name;
  final String lastFour;
  final double balance;

  CreditCardDetailEntity({
    List<EntityFailure> errors = const [],
    String name,
    String lastFour,
    double balance,
  })  : name = name ?? 'CreditCard',
        lastFour = lastFour ?? '0000',
        balance = balance ?? 0,
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        name,
        lastFour,
        balance,
      ];

  @override
  CreditCardDetailEntity merge({
    errors,
    String name,
    String lastFour,
    double balance,
  }) {
    return CreditCardDetailEntity(
      errors: errors ?? this.errors,
      name: name ?? this.name,
      lastFour: lastFour ?? this.lastFour,
      balance: balance ?? this.balance,
    );
  }
}
