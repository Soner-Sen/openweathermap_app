import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/navi_bar/navi_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const NaviBar(),
    );
  }
}
