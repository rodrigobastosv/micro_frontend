import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'module2_app.dart';

void main() {
  final module2 = Module2App();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Module 2',
      navigatorKey: NavigatorService.navigatorKey,
      onGenerateRoute: module2.generateRoute,
      initialRoute: '/',
    ),
  );
}
