import 'dart:typed_data';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../api/api.dart';

class CreatedNewUser extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Uint8List? newPictureFile = Uint8List(8);

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dc6qfseu7/image/upload?upload_preset=autwc6pa');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    /* final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path); */
/* 
    imageUploadRequest.files.add(file); */

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }

  Future<bool> createNewUser(
    String name,
    String email,
    String password,
    bool superUser,
    String description,
  ) async {
    print(newPictureFile);
    loading = true;
    const String url = '/auth/v1/signup';

    final data = {
      "email": email,
      "password": password,
      "data": {
        "full_name": name,
        "super_user": superUser,
        "description_user": description,
      }
    };

    final res = await dio.post(url, data: data);

    if (res.statusCode == 200) {
      print(res.data);
      loading = false;
      return true;
    } else {
      print(res.data);
      loading = false;
      return false;
    }
  }
}
