import 'package:demo/presentation/pages/login/login.dart';
import 'package:demo/presentation/pages/photos/photos_list.dart';
import 'package:demo/presentation/routes.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: Router.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
