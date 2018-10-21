import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

Dio dio = new Dio();
String uploadURL = "http://142.93.133.0:5000/upload/f184dbe0-2908-44cb-a664-124ae55bac4a";

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
