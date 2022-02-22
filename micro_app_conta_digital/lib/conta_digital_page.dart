import 'package:components/styles/design/design.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ContaDigitalPage extends StatelessWidget {
  const ContaDigitalPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Conta Digital',
          style: NimiaFonts.descriptionBold.copyWith(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigatorService.pop(),
        backgroundColor: Colors.red,
        child: const Icon(Icons.arrow_back_outlined),
      ),
    );
  }
}
