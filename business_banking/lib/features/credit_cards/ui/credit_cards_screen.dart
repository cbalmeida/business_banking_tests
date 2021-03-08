import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../model/credit_cards_list_view_model.dart';

class CreditCardsScreen extends Screen {
  final CreditCardsViewModel viewModel;
  final VoidCallback navigateToPayCard;

  CreditCardsScreen({
    @required this.viewModel,
    @required this.navigateToPayCard,
  }) : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CreditCardCard(
          viewModel: viewModel,
          navigateToPayCard: navigateToPayCard,
          key: Key('CreditCard1'),
        ),
      ],
    );
  }
}

class CreditCardCard extends StatelessWidget {
  const CreditCardCard({
    Key key,
    @required this.viewModel,
    @required this.navigateToPayCard,
  }) : super(key: key);

  final CreditCardsViewModel viewModel;
  final VoidCallback navigateToPayCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        viewModel.name,
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AutoSizeText(
                      ' *' + viewModel.lastFour.toString(),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Card Balance:",
                      style: TextStyle(color: Colors.black54, fontSize: 18.0),
                    ),
                    Text(
                      '\$' + viewModel.balance.toStringAsFixed(2),
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
                      key: Key('balance'),
                    )
                  ],
                ),
              ),
              RaisedButton(
                key: Key('pay_credit_card_button_key'),
                color: Colors.lightGreen,
                onPressed: () {
                  navigateToPayCard();
                },
                child: Text('Pay', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
