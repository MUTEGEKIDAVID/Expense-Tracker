
import 'dart:math';

import 'package:expensetracker/Screens/stats/stats.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var widgetList=[
    MainScreen(),
  StatScreen()

  ];
  Color selectedcolor= Colors.blue;
  Color unselectedcolor= Colors.grey;



  int _currentindex=0;

  void changeIndex(value){
    setState(() {
      _currentindex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: widgetList[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap:(value)=> changeIndex(value),
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.yellow,
        elevation: 3,
        items: [
          BottomNavigationBarItem
            (
            icon: Icon(Icons.home,
            color:_currentindex==0 ? selectedcolor : unselectedcolor
            ),
            label: 'home',

          ),
          BottomNavigationBarItem
            (
              icon: Icon(Icons.auto_graph,
                  color:_currentindex==1 ? selectedcolor : unselectedcolor
              ),
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
