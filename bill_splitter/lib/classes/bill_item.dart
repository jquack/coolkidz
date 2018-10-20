import 'package:bill_splitter/classes/concerned.dart';

class BillItem {
  String name;
  double price;
  List payers;

  BillItem({this.name, this.price, this.payers}): assert (name != null, price != null);

  addPayer(Concerned concerned){
    if (payers == null) {
      payers = [];
    }
    payers.add(concerned);
  }


}