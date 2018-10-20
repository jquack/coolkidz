import 'package:bill_splitter/classes/bill_item.dart';
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
    return Container(color: Colors.amber,);
  }
}
