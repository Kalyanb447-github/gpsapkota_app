import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'phoneAuthentication/phone_authentication.dart';
import 'screens/admin_panel/signIn.dart';
import 'screens/splash_screen.dart';
import 'screens/users_page/home_page.dart';
import 'screens/who_are_you.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //login checking
  bool _isLoggedIn = true;
  @override
  void initState() {
    _checkedIfLoggedIn();
    super.initState();
  }

  _checkedIfLoggedIn() async {
    //check if there is token
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _isLoggedIn ? SplashScreen() : SignInPage(),
    );
  }
}
