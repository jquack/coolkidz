import 'package:flutter/material.dart';

Widget editNameRow({
  BuildContext context,
  String text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Name: " + text),
        /*IconButton(
          icon: Icon(Icons.edit),
          onPressed: (() => editName(context)),
        ) */ //TODO later
      ],
    ),
  );
}

editName(BuildContext context) {
}

Widget editPriceRow({
  BuildContext context,
  double price,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Price: " + price.toStringAsFixed(2)),
        /*IconButton(
          icon: Icon(Icons.edit),
          onPressed: (() => editPrice(context)),
        )*/ //TODO later
      ],
    ),
  );
}

editPrice(BuildContext context) {
}

Widget editPayersRow({
  BuildContext context,
  List payers,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(payers.toString()),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: (() => editNames(context)),
        )
      ],
    ),
  );
}

editNames(BuildContext context) {
  print("edit!");//TODO add names from nameslist(board) to players(list from editPlayersRow)
}
