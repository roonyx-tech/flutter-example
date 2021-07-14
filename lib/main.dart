import 'package:e_shop_flutter/di/modules.dart';
import 'application.dart';
import 'package:flutter/material.dart';

void main() {
  //Initialize DI
  setUp();

  runApp(FutureBuilder(
      future: getIt.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Application();
        } else {
          return CircularProgressIndicator();
        }
      }));
}
