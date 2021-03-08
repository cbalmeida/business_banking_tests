import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import '../bloc/credit_card_detail_bloc.dart';
import 'credit_card_detail_presenter.dart';

class CreditCardDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<CreditCardDetailBloc>(
      create: (_) => CreditCardDetailBloc(),
      child: CreditCardDetailPresenter(),
    );
  }
}
