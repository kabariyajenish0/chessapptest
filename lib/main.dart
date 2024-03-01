import 'package:chess_app/bloc/app_blocs.dart';
import 'package:chess_app/screens/game_screen.dart';
import 'package:chess_app/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  createAppBlocs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chess Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
