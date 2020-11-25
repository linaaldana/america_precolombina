import 'package:america_precolombina/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'America Precolombina',
        debugShowCheckedModeBanner: false,
        home: Center(
          child: HomePage(),
        ));
  }
}
