import 'package:chess_app/screens/tictactoy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: Center(
          child: Text(
            "Games",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
      body: Container(
        height: 800,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 100],
            colors: [Color(0xffFFEFBA), Color(0xffFFFFFF)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => Get.to(GameScreen()),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.orange.shade100,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/chess.png",
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            InkWell(
              onTap: () => Get.to(TicTacToeBoard()),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/tictactoy.png",
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
