import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import '../bloc/credit_card_payment_bloc.dart';
import '../model/credit_card_payment_view_model.dart';
import 'credit_card_payment_screen.dart';

class CreditCardPaymentPresenter extends Presenter<CreditCardPaymentBloc, CreditCardPaymentViewModel, CreditCardPaymentScreen> {
  @override
  Stream<CreditCardPaymentViewModel> getViewModelStream(CreditCardPaymentBloc bloc) {
    return bloc.creditCardPaymentViewModelPipe.receive;
  }

  @override
  CreditCardPaymentScreen buildScreen(BuildContext context, CreditCardPaymentBloc bloc, CreditCardPaymentViewModel viewModel) {
    return CreditCardPaymentScreen(
      viewModel: viewModel,
      navigateToCashAccounts: () {
        _navigateToCashAccounts(context);
      },
    );
  }

  void _navigateToCashAccounts(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
