import 'package:flutter/material.dart';
import 'package:my_flutter_world_time/pages/choose_location.dart';
import 'package:my_flutter_world_time/pages/home.dart';
import 'package:my_flutter_world_time/pages/loading.dart';

void main() {
  return runApp(MaterialApp(
   // home: Home(),
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}

