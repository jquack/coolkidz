import 'package:bill_splitter/widgets/bill_item_widget.dart';
import 'package:flutter/material.dart';

class BillRoute extends StatefulWidget {
  final List bill;

  const BillRoute({Key key, this.bill}) : super(key: key);
  @override
  _BillRouteState createState() => _BillRouteState();
}

class _BillRouteState extends State<BillRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.bill.length,
        itemBuilder: (context, int) {
          return billItemWidget(context: context, item: widget.bill[int]);
        },
      ),
    );
  }
}
