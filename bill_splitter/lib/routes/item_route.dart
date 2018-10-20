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
    print(widget.item.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Item", context: context),
      body: Column(
        children: <Widget>[
          editRow(context: context, text: widget.item.name),
          editRow(context: context, text: widget.item.price.toString()),
          editRow(context: context, text: widget.item.payers.toString()),
        ],
      ),
    );
  }
}
