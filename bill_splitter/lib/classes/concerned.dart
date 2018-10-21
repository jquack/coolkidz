class Concerned{
  String name;
  double amount;
  double quantity;
  double price;

  Concerned({name, amount, quantity, price});

  factory Concerned.fromJson(Map<String, dynamic> json) {
    return Concerned(
      name: json['name'] as String,
      amount: json['amount'] as double,
      quantity: json['quantity'] as double,
    );
  }
}