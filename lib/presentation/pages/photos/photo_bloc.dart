import 'dart:async';

import 'package:demo/data/di/factory.dart';
import 'package:demo/data/models/app_result.dart';
import 'package:demo/domain/entities/photo.dart';
import 'package:demo/domain/usecases/fetch_photo_usecase.dart';

class PhotoBloc {
  final StreamController<List<Photo>> streamController =
      StreamController<List<Photo>>.broadcast();

  final FetchPhotoUsecase _usecase = ObjectFactory.providePhotoUsecase();

  void onDispose() {
    streamController.close();
  }

  void getPhotoList() async {
    //streamController.add(Loading());
    final response = await _usecase.execute();
    switch (response.status) {
      case Status.SUCCESS:
        streamController.sink.add(response.data);
        break;
      case Status.FAILURE:
        //streamController.sink.add(Failure(response.message));
        break;
    }
  }
}
