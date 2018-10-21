import 'package:bill_splitter/classes/bill_item.dart';
import 'package:bill_splitter/widgets/app_bar.dart';
import 'package:bill_splitter/widgets/edit_row.dart';
import 'package:flutter/material.dart';

class ItemRoute extends StatefulWidget {
  final BillItem item;

  const ItemRoute({Key key, this.item}) : super(key: key);
  @override
  _ItemRouteState createState() => _ItemRouteState();
}

class _ItemRouteState extends State<ItemRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Item", context: context),
      body: Column(
        children: <Widget>[
          editNameRow(context: context, text: widget.item.name,),
          editPriceRow(context: context, price: widget.item.price,),
          editPayersRow(context: context, payers: widget.item.payers),
        ],
      ),
    );
  }
}
