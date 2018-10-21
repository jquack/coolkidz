import 'package:bill_splitter/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class CheckoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Checkout",
        context: context,
        action: false,
      ),
      body: Container(),
    );
  }
}
