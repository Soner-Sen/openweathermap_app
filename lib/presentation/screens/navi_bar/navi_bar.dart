import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/home/home_screen.dart';

import '../next_day.dart/next_day.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({Key? key}) : super(key: key);

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const NextDayScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      //! IndexedStack = Behalten den State
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgrtoundColor: Colors.blue,
        //SelectedItemColor: Colors.white,
        //unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.wb_sunny_outlined),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            backgroundColor: Colors.blue,
            label: 'Tomorrow',
          ),
        ],
      ),
    );
  }
}
