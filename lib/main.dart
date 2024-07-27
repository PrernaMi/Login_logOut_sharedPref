import 'package:flutter/material.dart';

import 'login_page.dart';
import 'splash_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: SplashPage(),
    );
  }
}
