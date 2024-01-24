import 'package:amelia_prefb/firestore.dart';
import 'package:amelia_prefb/firestorex.dart';
import 'package:amelia_prefb/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 204, 204, 188)),
          useMaterial3: true,
        ),
        home: const HomeScreen());
  }
}
