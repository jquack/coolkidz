import 'package:bill_splitter/widgets/bill_item_widget.dart';
import 'package:flutter/material.dart';

class BillRoute extends StatefulWidget {
  final List bill;

  const BillRoute({Key key, this.bill}) : super(key: key);
  @override
  _BillRouteState createState() => _BillRouteState();
}

class _BillRouteState extends State<BillRoute> {
  Widget bodyWidget;

  @override
  void initState() {
    bodyWidget = Center(
      child: Text(
        "Loading...",
      ),
    );
    super.initState();
  }

  itemsList() {
    if (widget.bill != null) {
      setState(() {
        bodyWidget = ListView.builder(
          itemCount: widget.bill.length,
          itemBuilder: (context, int) {
            return billItemWidget(context: context, item: widget.bill[int]);
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget,
      floatingActionButton:
          IconButton(icon: Icon(Icons.refresh), onPressed: (() => itemsList())),
    );
  }
}
