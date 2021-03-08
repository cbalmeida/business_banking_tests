import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import '../bloc/credit_card_payment_bloc.dart';
import 'credit_card_payment_presenter.dart';

class CreditCardPaymentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<CreditCardPaymentBloc>(
      create: (_) => CreditCardPaymentBloc(),
      child: CreditCardPaymentPresenter(),
    );
  }
}
