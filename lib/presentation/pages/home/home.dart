import 'dart:convert';

import 'package:demo/domain/entities/photo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Photo> dataList = List<Photo>();

  void fetchPhotos() async {
    Response response =
        await get('https://jsonplaceholder.typicode.com/photos');
    List data = parsePhotos(response.body);
    print(data[1]);
    setState(() {
      dataList = data;
    });

    print(dataList[1].title);
  }

  List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
        title: Text('List'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: Text(dataList[index].title),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(dataList[index].thumbnailUrl),
                ),
              ));
            }),
      )),
    );
  }
}
