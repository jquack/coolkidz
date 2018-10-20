import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

Dio dio = new Dio();
String uploadURL = "http://142.93.133.0:5000/upload/cfae8417-951c-40bb-95e3-4046992ad659";

postImage(File image, Function convert) async {
  FormData formData = new FormData();

  formData.add("image", new UploadFileInfo(image, basename(image.path)));
  dio
      .post(uploadURL,
          data: formData,
          options: Options(method: 'POST', responseType: ResponseType.JSON))
      .then((response) => convert(response))
      .catchError((error) => print(error));
}
