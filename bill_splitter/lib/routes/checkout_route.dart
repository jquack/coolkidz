import 'package:bill_splitter/classes/concerned.dart';
import 'package:bill_splitter/utils/mock_data.dart';
import 'package:bill_splitter/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CheckoutRoute extends StatelessWidget {
  List<Concerned> payers;

  @override
  Widget build(BuildContext context) {
    payers = calculatePrice(people);
    return Scaffold(
      appBar: appBar(
        title: "Checkout",
        context: context,
        action: false,
      ),
      body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, i) {
            return element(payers[i].name, payers[i].price);
          }), //TODO change container to list of price per person
    );
  }

  calculatePrice(List<String> people) {
    List<Concerned> list = [];
    var rng = Random();
    for(int i = 0; i < people.length; i++){
      double price = rng.nextDouble()*100.0;
      list.add(Concerned(name: people[i], price: price));
      print(list[i].name);
    }
    return list;
  }
}

Widget element(name, price) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          "Price: " + price.toStringAsFixed(2),
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
