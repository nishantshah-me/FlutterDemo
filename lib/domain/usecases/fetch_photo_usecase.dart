import 'package:demo/data/models/app_result.dart';
import 'package:demo/data/repositories/photo_repository.dart';
import 'package:demo/domain/entities/photo.dart';

class FetchPhotoUsecase {
  final PhotoRepository repository;

  FetchPhotoUsecase(this.repository);

  Future<AppResult<List<Photo>>> execute() async {
    final response = await repository.getPhoto();
    switch (response.status) {
      case Status.SUCCESS:
        return AppResult.success(response.data);
        break;
      default:
        return AppResult.failure();
        break;
    }
  }
}
