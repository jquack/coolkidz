import 'dart:convert';
import 'dart:io';
import 'dart:async';
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

  @override
  initState() {
    super.initState();
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
      upload();
    }
  }

  convert(Response receivedResponse) {
    print(receivedResponse.data==null);
    print(receivedResponse.data);
    Map<String, dynamic> map = json.decode(receivedResponse.data);
    return map;
  }

  upload() async {
    Map<String, dynamic> response = await postImage(image, convert);
    navigateToBill(context, bill: response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.file(image),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.crop),
        onPressed: _cropImage,
        color: Colors.blue,
      ),
    );
  }
}
