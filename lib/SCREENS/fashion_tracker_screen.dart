import 'package:flutter/material.dart';

class FashionTrackerScreen extends StatelessWidget {
  const FashionTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fashion Tracker')),
      body: Center(child: const Text('Fashion Tracker Screen Content')),
    );
  }
}
