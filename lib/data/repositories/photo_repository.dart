import 'package:demo/data/datasources/RemoteDatasource.dart';
import 'package:demo/data/models/app_result.dart';
import 'package:demo/domain/entities/photo.dart';

class PhotoRepository {
  final RemoteDatasource remoteDatasource = RemoteDatasource();

  Future<AppResult<List<Photo>>> getPhoto() {
    return remoteDatasource.fetchPhotos();
  }
}
