class BillItem {
  String name;
  double price;
  List<String> payers;

  BillItem({name, price, payers});

  factory BillItem.fromJson(Map<String, dynamic> json) {
    return BillItem(
      name: json['name'] as String,
      price: json['price'] as double,
      payers: json['payers'] as List<String>,
    );
  }
}
