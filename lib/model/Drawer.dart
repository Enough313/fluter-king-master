import 'package:flutter/material.dart';
import 'package:flutter_king_master/Drawer_navigation_item/favourites.dart';
import 'package:flutter_king_master/bottom_navigation_item/main_otp_ui_design.dart';
import 'package:flutter_king_master/flutter_king_home.dart';
import 'package:get/get.dart';

class drawer_item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Qaiser'),
            accountEmail: Text('qaiser@gmai.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('P'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => flutter_king_home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favourite'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Favourites()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Otp Design'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => main_otp_ui_design()));
            },
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
