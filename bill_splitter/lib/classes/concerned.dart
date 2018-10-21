class Concerned{
  String name;
  double amount;
  double quantity;

  Concerned({name, amount, quantity});

  factory Concerned.fromJson(Map<String, dynamic> json) {
    return Concerned(
      name: json['name'] as String,
      amount: json['amount'] as double,
      quantity: json['quantity'] as double,
    );
  }
}