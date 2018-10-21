import 'package:bill_splitter/classes/concerned.dart';
class Board {
  String name;
  String address;
  List payers;

  Board({this.name, this.address, this.payers}): assert (name != null);

  addPayer(Concerned concerned){
    if (payers == null) {
      payers = [];
    }
    payers.add(concerned);
  }


}