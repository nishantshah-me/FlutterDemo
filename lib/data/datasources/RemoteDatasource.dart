import 'dart:convert';
import 'dart:math';

import 'package:demo/data/models/app_result.dart';
import 'package:demo/domain/entities/photo.dart';
import 'package:http/http.dart';

abstract class Datasource {
  Future<bool> doSignIn(String email, String password);
  Future<AppResult<List<Photo>>> fetchPhotos();
}

class RemoteDatasource extends Datasource {
  @override
  Future<bool> doSignIn(String email, String password) {
    return null;
  }

  @override
  Future<AppResult<List<Photo>>> fetchPhotos() async {
    Response response =
        await get('https://jsonplaceholder.typicode.com/photos');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<Photo> data =
          parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
      return AppResult.success(data);
    } else {
      // If that call was not successful, throw an error.
      return AppResult.failure();
    }
  }
}
