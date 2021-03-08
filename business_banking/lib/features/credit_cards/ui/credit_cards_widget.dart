import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../bloc/credit_cards_bloc.dart';
import 'credit_cards_presenter.dart';

class CreditCardsWidget extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    if (debugEnabled) {
      logger().debug('Widget Built');
    }

    return BlocProvider<CreditCardsBloc>(
      create: (_) => CreditCardsBloc(),
      child: CreditCardsPresenter(),
    );
  }
}
