import 'package:flutter/material.dart';

class EnergyCalculatorScreen extends StatelessWidget {
  const EnergyCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Energy Calculator')),
      body: Center(child: const Text('Energy Calculator Screen Content')),
    );
  }
}
