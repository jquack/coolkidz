import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:bill_splitter/classes/bill_item.dart';
import 'package:bill_splitter/utils/navigators.dart';
import 'package:bill_splitter/utils/server_utils.dart';
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
  List response;

  @override
  initState() {
    super.initState();
    response = null;
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
      upload(context);
    }
  }

  convert(Response receivedResponse) {
    print(receivedResponse.data == null);
    print(receivedResponse.data);
    Map<String, dynamic> items =
        json.decode(receivedResponse.data); //here we have the full expense
    items = items["items"]; //here we have the list of items
    return items.values
        .map((item) => BillItem.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  upload(BuildContext context) async {
    response = await postImage(image, convert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.file(image),
              ),
              RaisedButton(
                onPressed: navigate(context, response),
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

  navigate(BuildContext context, List response) {
    if (response != null) {
      navigateToBill(context, bill: response);
    }
  }
}
