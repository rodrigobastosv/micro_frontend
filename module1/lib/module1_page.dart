import 'package:components/styles/design/design.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class Module1Page extends StatelessWidget {
  const Module1Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Module1',
          style: IuppFonts.descriptionBold.copyWith(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => dispatch(
          Event(name: 'NextPage'),
        ),
        backgroundColor: Colors.green,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
