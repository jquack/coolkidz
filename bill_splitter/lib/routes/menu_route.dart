import 'dart:io';

import 'package:bill_splitter/classes/bill_item.dart';
import 'package:bill_splitter/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MenuRoute extends StatefulWidget {
  @override
  State<MenuRoute> createState() => _MenuRouteState();
}

class _MenuRouteState extends State<MenuRoute>{
  File _imageFile;
  BillItem item;

  @override
  initState(){
    super.initState();
    item = BillItem(name: "Chips", price: 3.570);
  }

  getImage(source) async {
    File image = await ImagePicker.pickImage(source: source);

    if (image != null){
      setState(() {
        _imageFile = image;
        navigateToCrop(context, image: _imageFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Take a photo"),
              onPressed: (() => getImage(ImageSource.camera)),
            ),
            RaisedButton(
              child: Text("Select image from gallery"),
              onPressed: (() => getImage(ImageSource.gallery)),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(icon: Icon(Icons.map),onPressed: (()=>navigateToItem(context, item: item)),),
    );
  }
}
