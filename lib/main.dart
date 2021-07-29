import 'package:flutter/material.dart';

import 'Page/dashBord.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey[600]),
      debugShowCheckedModeBanner: false,
      home: ExampleExpandableFab(),
    );
  }
}
