import 'package:beauty_flutter/modules/create_account/create_account_page.dart';
import 'package:beauty_flutter/modules/home/home_page.dart';
import 'package:beauty_flutter/modules/login/login_page.dart';
import 'package:beauty_flutter/modules/recovery_password/recovey_password.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beauty',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/create': (context) => CreateAccountPage(),
        '/recovery': (context) => RecoveryPasswordPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
