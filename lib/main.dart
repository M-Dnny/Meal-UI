import 'package:burger/components/burger_topbar.dart';
import 'package:burger/components/constant.dart';
import 'package:burger/pages/blood_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: headerColor,
        accentColor: Colors.deepOrange,
        appBarTheme: AppBarTheme(
          color: headerColor,
          centerTitle: true,
        ),
        cardColor: Colors.white,
        primaryColor: headerColor1,
        bottomAppBarColor: headerColor1,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: headerColor,
        accentColor: Colors.deepOrange,
        appBarTheme: AppBarTheme(
          color: headerColor,
          centerTitle: true,
        ),
        cardColor: Color.fromRGBO(20, 20, 20, 1),
        primaryColor: headerColor1,
        bottomAppBarColor: headerColor1,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HumburgerTopBar(),
      routes: {
        BloodPage.tag: (_) => BloodPage(),
      },
    );
  }
}
