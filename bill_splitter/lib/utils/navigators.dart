import 'dart:io';

import 'package:bill_splitter/classes/bill_item.dart';
import 'package:bill_splitter/routes/bill_route.dart';
import 'package:bill_splitter/routes/crop_route.dart';
import 'package:bill_splitter/routes/item_route.dart';
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