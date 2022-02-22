import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

const primaryColor = Colors.blue;
const backgroundColor = Colors.white;
final disabledColor = Colors.grey;

Future<void> loadPageWithButton(
  WidgetTester tester, {
  required Widget button,
}) async {
  await loadPageWithWidget(
    tester,
    widget: button,
    theme: ThemeData(
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      disabledColor: disabledColor,
    ),
  );
}
