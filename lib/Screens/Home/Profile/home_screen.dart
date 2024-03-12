
import 'dart:math';

import 'package:flutter/material.dart';

import 'main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: MainScreen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 3,
        items: [
          BottomNavigationBarItem
            (
            icon: Icon(Icons.home),
            label: 'home'
          ),
          BottomNavigationBarItem
            (
              icon: Icon(Icons.auto_graph),
            label:'stats '
          ),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
            height:60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,

                ],
                transform: const GradientRotation(pi / 4)
              )
            ),
            child: const Icon(Icons.add)),
        onPressed: (){},
      ),
    );
  }
}
