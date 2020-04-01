import 'package:demo/presentation/pages/login/login.dart';
import 'package:demo/presentation/pages/photos/photos_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static const String LOGIN = "/";
  static const String LANDING = "/landing";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN:
        return MaterialPageRoute(builder: (_) => Login());
        break;
      case LANDING:
        return MaterialPageRoute(builder: (_) => PhotoList());
        break;
    }
  }
}
