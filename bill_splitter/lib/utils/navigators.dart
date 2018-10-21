import 'dart:io';

import 'package:bill_splitter/classes/bill_item.dart';
import 'package:bill_splitter/routes/bill_route.dart';
import 'package:bill_splitter/routes/checkout_route.dart';
import 'package:bill_splitter/routes/crop_route.dart';
import 'package:bill_splitter/routes/item_route.dart';
import 'package:bill_splitter/routes/main_route.dart';
import 'package:bill_splitter/routes/menu_route.dart';
import 'package:bill_splitter/routes/board_new_route.dart';
import 'package:bill_splitter/routes/board_name_route.dart';
import 'package:flutter/material.dart';

navigateToCrop(BuildContext context, {File image}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CropRoute(image)));
}

navigateToBill(BuildContext context, {List bill}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BillRoute(bill: bill)));
}

navigateToItem(BuildContext context, {BillItem item}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemRoute(item: item)));
}

navigateToCheckout(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutRoute()));
}
navigateToMain(BuildContext context, {List bill}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainRoute()));
}
navigateToMenu(BuildContext context, {List bill}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuRoute()));
}
navigateToNewBoard(BuildContext context, {String name}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BoardNewRoute(name: name)));
}
navigateToBoardName(BuildContext context, {List bill}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BoardNameRoute()));
}