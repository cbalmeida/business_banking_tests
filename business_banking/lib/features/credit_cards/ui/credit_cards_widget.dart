import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../bloc/credit_cards_bloc.dart';
import 'credit_cards_presenter.dart';

class CreditCardsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreditCardsBloc>(
      create: (_) => CreditCardsBloc(),
      child: CreditCardsPresenter(),
    );
  }
}
