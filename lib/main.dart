import 'package:expensetracker/Screens/Profile/home_screen.dart';
import 'package:expensetracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer= SimpleBlocObserver();
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
              background: Colors.grey.shade200,
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


