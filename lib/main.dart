import 'package:flutter/material.dart';
import 'package:projectuts/pages/pages.dart';
import 'package:projectuts/shared/shared.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorPalette.purpleColor,
        primaryColor: primaryColor,
        canvasColor: Colors.transparent
      ),
      home: WellcomePage(),
    );
  }
}
