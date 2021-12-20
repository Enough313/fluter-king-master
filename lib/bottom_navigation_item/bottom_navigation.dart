import 'package:flutter/material.dart';
import 'package:flutter_king_master/bottom_navigation_item/Q&A/q&answer.dart';
import 'package:flutter_king_master/bottom_navigation_item/advance_item.dart';
import 'package:flutter_king_master/check_internet_connection/connectivity_provider.dart';
import 'package:flutter_king_master/flutter_king_home.dart';
import 'package:flutter_king_master/main_listView_folder/firestore_data_listview/full_daa_listview.dart';
import 'package:flutter_king_master/main_listView_folder/full_listview.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
    // Text(
    //   'Index 2: Ui design',
    //   style: optionStyle,
    // ),
    ListPage(),
    // Text(
    //   'Index 2: Q/a',
    //   style: optionStyle,
    // ),
    QuestionAnswer(),
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
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMoitoring();
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
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Advance',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('photo/ui.png')),
            label: 'UX/UI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Q/A',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Bookmark',
          ),
        ],
        selectedItemColor: Color(0XffFFBD2E),
        unselectedItemColor: Colors.yellow.withOpacity(.60),
        backgroundColor: Color(0xffF2F4F3),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
