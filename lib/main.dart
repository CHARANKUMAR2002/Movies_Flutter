import 'package:flutter/material.dart';
import 'movies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black, brightness: Brightness.dark),
      home: Movies(),
    );
  }
}