import 'package:flutter/material.dart';

import 'feature/homepage/home_page.dart';
import 'feature/profile/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}
