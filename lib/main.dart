import 'package:expensetracker/Screens/Home/Profile/home_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expanse Tracker",
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              background: Colors.grey.shade100,
              onBackground: Colors.black,
              primary:Color(0xFF00B2B7),
              secondary: Color(0xFFE064F7),
              tertiary: Color(0xFFFF8D6C),
            outline: Colors.grey
          )
      ),
      home: HomeScreen(),

    );;
  }
}


