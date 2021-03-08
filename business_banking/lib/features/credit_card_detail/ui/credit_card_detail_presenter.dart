import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import '../bloc/credit_card_detail_bloc.dart';
import '../model/credit_card_detail_view_model.dart';
import 'credit_card_detail_screen.dart';

class CreditCardDetailPresenter extends Presenter<CreditCardDetailBloc, CreditCardDetailViewModel, CreditCardDetailScreen> {
  @override
  Stream<CreditCardDetailViewModel> getViewModelStream(CreditCardDetailBloc bloc) {
    return bloc.creditCardDetailViewModelPipe.receive;
  }

  @override
  CreditCardDetailScreen buildScreen(BuildContext context, CreditCardDetailBloc bloc, CreditCardDetailViewModel viewModel) {
    return CreditCardDetailScreen(
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
