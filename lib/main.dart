import 'package:flutter/material.dart';
import 'package:pro_nutricion/pages/home.dart';
import 'package:pro_nutricion/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App_Nutricion_EP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const LoginPages(),
        '/create-users': (context) => const HomePages(),
      },
    );
  }
}
