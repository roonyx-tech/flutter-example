
import 'package:flutter/material.dart';

import 'core/application.dart';
import 'core/di/modules.dart';

void main() {
  //Initialize DI
  setUp();

  runApp(FutureBuilder(
      future: getIt.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Application();
        } else {
          return const CircularProgressIndicator();
        }
      }));
}
