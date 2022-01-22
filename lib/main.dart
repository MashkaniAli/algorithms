import 'package:flutter/material.dart';
import 'package:quick_sort_algoritm/sc_home_page.dart';
import 'package:quick_sort_algoritm/sc_quick_sort_algorithm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IRANSANS'
      ),
      title: 'Quick Sort Algorithm',
      home: const HomePageScreen(),
    );
  }
}

