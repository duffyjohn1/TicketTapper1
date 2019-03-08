import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:tickettapper/Payment/Colors.dart';
import 'package:tickettapper/Payment/widgets/cookie_button.dart';

//Ticket Price
enum PaymentType { cardPayment, googlePay, applePay }
final int cookieAmount = 225;

String getCookieAmount() => (cookieAmount / 100).toStringAsFixed(2);

class AddCard extends StatelessWidget {
  final bool googlePayEnabled;
  final bool applePayEnabled;
  AddCard({this.googlePayEnabled, this.applePayEnabled});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0))),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: _title(context),
            ),
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: 300,
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _ShippingInformation(),
                  _LineDivider(),
                  _PaymentTotal(),
                  _LineDivider(),
                  _RefundInformation(),
                  _payButtons(context),
                ]),
            ),
        ]),
    );

  Widget _title(context) =>
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
                color: closeButtonColor)),
        Container(
          child: Expanded(
            child: Text(
              "Buy your Ticket",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
            ),
          ),
        Padding(padding: EdgeInsets.only(right: 56)),
      ]);

  Widget _payButtons(context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      CookieButton(
        text: "Pay with card",
        onPressed: () {
          Navigator.pop(context, PaymentType.cardPayment);
        },
        ),
      Container(
        height: 64,
        width: MediaQuery.of(context).size.width * .4,
        child: RaisedButton(
          onPressed: googlePayEnabled || applePayEnabled ? () {
            if (Platform.isAndroid) {
              Navigator.pop(context, PaymentType.googlePay);
            } else if (Platform.isIOS) {
              Navigator.pop(context, PaymentType.applePay);
            }
          } : null,
          child: Image(
              image: (Theme.of(context).platform == TargetPlatform.iOS)
                  ? AssetImage("assets/applePayLogo.png")
                  : AssetImage("assets/googlePayLogo.png")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          color: Colors.black,
          ),
        ),
    ],
    );
}

class _ShippingInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(left: 30)),
      Text(
        "Stop: ",
        style: TextStyle(fontSize: 16, color: mainTextColor),
        ),
      Padding(padding: EdgeInsets.only(left: 30)),
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "4680",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              ),
            Padding(
              padding: EdgeInsets.only(bottom: 6),
              ),
            Text(
              "Whitehall\nDCU\nBallymun Road",
              style: TextStyle(fontSize: 16, color: subTextColor),
              ),
          ]),
    ],
    );
}

class _LineDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Divider(
        height: 1,
        color: dividerColor,
        ));
}

class _PaymentTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: EdgeInsets.only(left: 30)),
      Text(
        "Total",
        style: TextStyle(fontSize: 16, color: mainTextColor),
        ),
      Padding(padding: EdgeInsets.only(right: 47)),
      Text(
        "\€${getCookieAmount()}",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
        ),
    ],
    );
}

class _RefundInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FittedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          width: MediaQuery.of(context).size.width - 60,
          child: Text(
            "You can refund this transaction through your Square dashboard, go to squareup.com/dashboard.",
            style: TextStyle(fontSize: 12, color: subTextColor),
            ),
          ),
      ],
      ),
    );
}
