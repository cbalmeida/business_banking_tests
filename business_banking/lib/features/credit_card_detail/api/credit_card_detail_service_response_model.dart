import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class CreditCardDetailServiceResponseModel extends Equatable implements JsonResponseModel {
  final String name;
  final String lastFour;
  final double balance;

  CreditCardDetailServiceResponseModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'CreditCard',
        lastFour = json['lastFour'] ?? '0000',
        balance = json['balance'] ?? 0.00;

  @override
  List<Object> get props => [
        name,
        lastFour,
        balance,
      ];
}
