import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:bill_splitter/classes/bill_item.dart';
import 'package:bill_splitter/utils/navigators.dart';
import 'package:bill_splitter/utils/server_utils.dart';
import 'package:bill_splitter/widgets/app_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class CropRoute extends StatefulWidget {
  final File image;

  const CropRoute(
    this.image, {
    Key key,
  }) : super(key: key);

  @override
  _CropRouteState createState() => _CropRouteState();
}

class _CropRouteState extends State<CropRoute> {
  File image;
  List<BillItem> response;

  @override
  initState() {
    super.initState();
    response = [];
    image = widget.image;
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      toolbarTitle: 'Cropper',
      toolbarColor: Colors.blue,
    );
    if (croppedFile != null) {
      setState(() {
        image = croppedFile;
      });
    }
  }

  void convert(Response receivedResponse) {
    Map<String, dynamic> items =
        json.decode(receivedResponse.data); //here we have the full expense
    List itemList = items["items"];
    itemList.forEach((item) => response.add(BillItem(name: item[0], price: item[item.length - 1])));
    print("ItemList: $itemList");
  }

  upload(BuildContext context) async {
    await postImage(image, convert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, backwards: true, title: "Crop image"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.file(image),
              ),
              RaisedButton(
                onPressed: (() => navigate(context)),
                child: Text("Send"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.crop),
        onPressed: (() => _cropImage()),
        color: Colors.blue,
      ),
    );
  }

  navigate(BuildContext context) {
    upload(context);
    navigateToBill(context, bill: response);
  }
}
