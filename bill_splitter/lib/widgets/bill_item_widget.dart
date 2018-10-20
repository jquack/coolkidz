import 'package:bill_splitter/classes/bill_item.dart';
import 'package:bill_splitter/utils/navigators.dart';
import 'package:flutter/material.dart';

Widget billItemWidget({BillItem item, BuildContext context}) {
  payersList() {
    List<String> payers = item.payers;
    if (payers != null) {
      String payersString =
          payers.reduce((payers, nextPayer) => payers + nextPayer + ', ');
      payersString.substring(0, payersString.length - 3);
      return Text(
        "Payers: " + payersString,
        style: TextStyle(color: Colors.grey),
      );
    } else {
      return Container();
    }
  }

  return InkWell(
    onTap: (() => navigateToItem(context)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Name: " + item.name,
            ),
            Text(
              "Price: " + item.price.toStringAsFixed(2),
            ),
          ],
        ),
        payersList(),
      ],
    ),
  );
}
