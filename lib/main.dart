import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic/home_screen.dart';
import 'package:tic/my_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff00061a),
        shadowColor: const Color(0xff001456),
        splashColor: const Color(0xff4169e8),
      ),
      home: ChangeNotifierProvider<MyProvider>(
        child: HomePage(),
        create: (_) => MyProvider(),
      ),
    );
  }
}
