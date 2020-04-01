import 'package:demo/data/di/factory.dart';
import 'package:demo/domain/entities/photo.dart';
import 'package:demo/presentation/pages/photos/photo_bloc.dart';
import 'package:flutter/material.dart';

class PhotoList extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<PhotoList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<Photo> photoList = List<Photo>();
  final PhotoBloc bloc = ObjectFactory.providePhotoBloc();

  @override
  void initState() {
    bloc.streamController.stream.listen((data) {
      print(data);
    });
    bloc.getPhotoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Stream of list'),
      ),
      body: StreamBuilder(
        stream: bloc.streamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Photo> dataList = snapshot.data;
          if (dataList == null) {
            dataList = List<Photo>();
          }
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(dataList[index].title),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(dataList[index].thumbnailUrl),
                    ),
                  ));
                }),
          ));
        },
      ),
    );
  }
}
