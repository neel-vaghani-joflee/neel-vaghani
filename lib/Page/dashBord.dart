import 'package:flutter/material.dart';
import 'package:tiny_expence/Widget/floatingActionButton.dart';

@immutable
class ExampleExpandableFab extends StatelessWidget {
  const ExampleExpandableFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: Drawer(),
      body: Container(),
      floatingActionButton: FloatingAction(),
    );
  }
}
