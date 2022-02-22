import 'package:components/styles/design/design.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class Module2Page extends StatelessWidget {
  const Module2Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Module2',
          style: IuppFonts.descriptionBold.copyWith(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigatorService.pop(),
        backgroundColor: Colors.red,
        child: Icon(Icons.arrow_back_outlined),
      ),
    );
  }
}
