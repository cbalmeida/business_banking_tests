import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../routes.dart';
import '../model/credit_card_detail_view_model.dart';

class CreditCardDetailScreen extends Screen {
  final CreditCardDetailViewModel viewModel;
  final VoidCallback navigateToCashAccounts;

  final _textFieldController = TextEditingController();

  CreditCardDetailScreen({
    @required this.viewModel,
    @required this.navigateToCashAccounts,
  }) : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          child: Icon(
            Icons.chevron_left,
            size: 40.0,
          ),
          onTap: () {
            navigateToCashAccounts();
          },
          key: Key('backButton'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              viewModel.name,
            ),
            Text(
              '*' + viewModel.lastFour,
              key: Key('ADappBarL4'),
            )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(children: [
            Container(child: createCreditCardInfoSection(viewModel)),
            Container(
              child: createPaySection(_textFieldController, () {
                _onPaymentButtonPressed(build);
              }),
            ),
          ]),
        ],
      ),
    );
  }

  void _onPaymentButtonPressed(BuildContext build) {
    _checkIfPaymentValueWasEnteredAndThenGoToPaymentScreen(build);
  }

  void _checkIfPaymentValueWasEnteredAndThenGoToPaymentScreen(BuildContext build) {
    double paymentValue = _getEnteredPaymentValue();
    if (paymentValue > 0.00) {
      _navigateToCreditCardPayment(build);
    } else {
      _showInvalidPaymentValueDialog(build);
    }
  }

  double _getEnteredPaymentValue() {
    if (_textFieldController.text.toString().length == 0) return 0;
    return double.parse(_textFieldController.text.toString());
  }

  void _navigateToCreditCardPayment(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.creditCardPaymentRoute);
  }

  void _showInvalidPaymentValueDialog(BuildContext build) {
    showDialog(
      context: build,
      builder: (_) => AlertDialog(
        title: Text('Invalid'),
        content: Text('Payment value entered is incorrect.'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(build).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}

Container createCreditCardInfoSection(CreditCardDetailViewModel viewModel) {
  var _usdCurrency = new NumberFormat("#,##0.00", "en_US");
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Card Balance:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis),
              Text("\$" + _usdCurrency.format(viewModel.balance),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300), key: Key('creditCardsCard' + 'Balance'))
            ],
          ),
        ],
      ),
    ),
  );
}

Padding createPaySection(TextEditingController controller, Function onPayButtonPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
    child: Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Enter the amount to pay"),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"^\d{0,}\.?\d{0,2}")),
          ],
        ),
        FlatButton(
          color: Colors.lightGreen,
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
          onPressed: onPayButtonPressed,
          child: Text(
            "Pay",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    ),
  );
}
