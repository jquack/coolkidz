import 'dart:io';

import 'package:bill_splitter/routes/crop_route.dart';
import 'package:flutter/material.dart';

navigateToCrop(BuildContext context, {File image}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CropRoute(image)));
}

navigateToBill(BuildContext context, {Map<String, dynamic> bill}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BillRoute(bill)));
}
