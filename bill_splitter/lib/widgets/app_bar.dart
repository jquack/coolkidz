import 'package:bill_splitter/utils/navigators.dart';
import 'package:flutter/material.dart';

Widget appBar({String title, bool backwards = true, BuildContext context}) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (() => Navigator.of(context).pop())),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.account_balance_wallet),
        onPressed: (() => navigateToCheckout(context)),
      )
    ],
  );
}
