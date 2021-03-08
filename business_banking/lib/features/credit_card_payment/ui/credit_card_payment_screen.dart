import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../model/credit_card_payment_view_model.dart';

class CreditCardPaymentScreen extends Screen {
  final CreditCardPaymentViewModel viewModel;
  final VoidCallback navigateToCashAccounts;

  CreditCardPaymentScreen({
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
            Navigator.of(build).popUntil(ModalRoute.withName("hub"));
          },
          key: Key('backButton'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText("Payment Information"),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(children: [
            Container(child: createCreditCardInfoSection(build, viewModel)),
          ]),
        ],
      ),
    );
  }
}

Container createCreditCardInfoSection(BuildContext buildContext, CreditCardPaymentViewModel creditCardPaymentViewModel) {
  final media = MediaQuery.of(buildContext).size;
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(creditCardPaymentViewModel.cardName, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis),
              Text(creditCardPaymentViewModel.cardLastFour,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400), key: Key('creditCardsCard' + 'CardNumber'))
            ],
          ),
          SizedBox(height: media.width * .03),
          createCreditCardInfoSectionPaymentInfo(creditCardPaymentViewModel),
        ],
      ),
    ),
  );
}

Column createCreditCardInfoSectionPaymentInfo(CreditCardPaymentViewModel creditCardPaymentViewModel) {
  if (creditCardPaymentViewModel.paymentWasSuccessful)
    return createCreditCardInfoSectionSuccessfulPayment(creditCardPaymentViewModel);
  else
    return createCreditCardInfoSectionFailurePayment(creditCardPaymentViewModel);
}

Column createCreditCardInfoSectionSuccessfulPayment(CreditCardPaymentViewModel creditCardPaymentViewModel) {
  var _usdCurrency = new NumberFormat("#,##0.00", "en_US");
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Payment Succeed', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Payment Value:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis),
          Text("\$" + _usdCurrency.format(creditCardPaymentViewModel.paymentValue),
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300), key: Key('creditCardsCard' + 'Balance'))
        ],
      ),
    ],
  );
}

Column createCreditCardInfoSectionFailurePayment(CreditCardPaymentViewModel creditCardPaymentViewModel) {
  var _usdCurrency = new NumberFormat("#,##0.00", "en_US");
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Payment NOT Succeed',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Colors.red,
              ),
              overflow: TextOverflow.ellipsis),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Value Requested:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis),
          Text("\$" + _usdCurrency.format(creditCardPaymentViewModel.paymentValue),
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300), key: Key('creditCardsCard' + 'PaymentValue'))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Reason:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis),
          Text(creditCardPaymentViewModel.reasonPaymentNotSuccessful,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300), key: Key('creditCardsCard' + 'FailureReason'))
        ],
      ),
    ],
  );
}
