import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/second_page.dart';
import 'pages/third_page.dart';

// Ein Stateful-Widget, verwaltet drei Unterseiten
class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // die Nummer der aktuellen Seite (0..2)
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    // Das ist die Liste der eigentlichen Seiten
    HomePage(),
    SecondPage(),
    ThirdPage(),
  ];

  // der Eventhandler, wenn die Seite gewechselt wird
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hauptseite'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Hier stehen die Icons der Hauptnavigation
          // kann erweitern werden
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'Seite 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_sharp),
            label: 'Seite 3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
