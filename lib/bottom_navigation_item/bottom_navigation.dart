import 'package:flutter/material.dart';
import 'package:flutter_king_master/bottom_navigation_item/advance_item.dart';
import 'package:flutter_king_master/flutter_king_home.dart';

/// This is the stateful widget that the main application instantiates.
class navigation extends StatefulWidget {
  @override
  State<navigation> createState() => _navigationState();
}

/// This is the private State class that goes with navigation.
class _navigationState extends State<navigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    flutter_king_home(),
    advance_page(),
    Text(
      'Index 2: Ui design',
      style: optionStyle,
    ),
    Text(
      'Index 2: Q/a',
      style: optionStyle,
    ),
    Text(
      'Index 2: Admin',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('photo/adavnce.png')),
            label: 'Advance',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('photo/ux.png')),
            label: 'UX/UI',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('photo/newqa.jpg')),
            label: 'Q/A',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Admin',
          ),
        ],
        selectedItemColor: Color(0Xff2699FB),
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
