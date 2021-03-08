import 'dart:async';

import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../routes.dart';
import '../bloc/credit_cards_bloc.dart';
import '../model/credit_cards_list_view_model.dart';
import 'credit_cards_screen.dart';

class CreditCardsPresenter extends Presenter<CreditCardsBloc, CreditCardsViewModel, CreditCardsScreen> {
  @override
  Stream<CreditCardsViewModel> getViewModelStream(CreditCardsBloc bloc) {
    return bloc.creditCardsViewModelPipe.receive;
  }

  @override
  CreditCardsScreen buildScreen(BuildContext context, CreditCardsBloc bloc, CreditCardsViewModel viewModel) {
    return CreditCardsScreen(
      viewModel: viewModel,
      navigateToPayCard: () {
        _navigateToPayCard(context);
      },
    );
  }

  void _navigateToPayCard(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.creditCardDetailsRoute);
  }
}
