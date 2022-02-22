import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'module1_app.dart';

void main() {
  final module1 = Module1App();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Module 1',
      navigatorKey: NavigatorService.navigatorKey,
      onGenerateRoute: module1.generateRoute,
      initialRoute: '/',
    ),
  );
}
