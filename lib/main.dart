import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/dash/dash_page.dart';
import 'package:flutter_app/src/pages/login/login_page.dart';
import 'package:flutter_app/src/pages/home/home_page.dart';
import 'package:flutter_app/src/pages/register/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'home': (BuildContext context) =>
            const MyHomePage(title: 'Flutter Demo Home Page'),
        'dash': (BuildContext context) => const DashPage(),
        'register': (BuildContext context) => const RegisterPage()
      },
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
