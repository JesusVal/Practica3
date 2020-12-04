import 'package:flutter/material.dart';

import 'home_page.dart';

// API key
// 509736b666f2409c925421d44ea84c25

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
