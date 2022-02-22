import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

Future<void> loadPageWithFooter(
  WidgetTester tester, {
  required Widget footer,
}) async {
  await mockNetworkImages(() async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: footer,
        ),
      ),
    );
  });
}
