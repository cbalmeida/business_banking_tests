import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TransferFundsResponseModel extends Equatable
    implements JsonResponseModel {
  final bool didSucceed;
  final String confirmation;

  TransferFundsResponseModel.fromJson(Map<String, dynamic> json)
      : didSucceed = true,
        confirmation = json['confirmation'];

  @override
  List<Object> get props => [didSucceed, confirmation];
}