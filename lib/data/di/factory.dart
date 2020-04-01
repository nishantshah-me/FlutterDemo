import 'package:demo/data/repositories/photo_repository.dart';
import 'package:demo/domain/usecases/fetch_photo_usecase.dart';
import 'package:demo/presentation/pages/photos/photo_bloc.dart';

class ObjectFactory {
  static PhotoRepository providePhotoRepository() {
    return PhotoRepository();
  }

  static FetchPhotoUsecase providePhotoUsecase() {
    return FetchPhotoUsecase(providePhotoRepository());
  }

  static PhotoBloc providePhotoBloc() {
    return PhotoBloc();
  }
}
