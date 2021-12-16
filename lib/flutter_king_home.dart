import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_king_master/check_internet_connection/connectivity_provider.dart';
import 'package:flutter_king_master/expendable_list/page/advanced_tile_page.dart';
import 'package:flutter_king_master/main_listView_folder/ListView_All_detail.dart';
import 'package:flutter_king_master/main_listView_folder/detail_page/fruit_full_detail.dart';
import 'package:flutter_king_master/main_listView_folder/full_listview.dart';
import 'package:flutter_king_master/model/Drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class flutter_king_home extends StatefulWidget {
  @override
  State<flutter_king_home> createState() => _flutter_king_homeState();
}

class _flutter_king_homeState extends State<flutter_king_home> {
  int _currentIndex = 0;
  int _selectedIndex = 0;
  // buttom navigatoin item
  final tabs = [
    Center(
      child: Text('home'),
    ),
    Center(
      child: Text('Advance'),
    ),
    Center(
      child: Text('UX/UI'),
    ),
    Center(
      child: Text('Q/A'),
    ),
    Center(
      child: Text('Admin'),
    ),
  ];

  List<String> myWidget = [
    'appbar',
    'tool bar',
    'remove status bar',
    'gridview'
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMoitoring();
  }

  @override
  Widget build(BuildContext context) {
    // return pageUI();

    return Scaffold(
              drawer: drawer_item(),
              appBar: appBar(),
              backgroundColor: Color(0Xff0195FF),
              body: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Welcome to ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Flutter King ',
                                    style: TextStyle(
                                        color: Color(0Xff0072C1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Awesome UI + Code Free',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  my_listView()));
                                              // builder: (context) =>
                                              //     ListPage()));
                                    },
                                    child: Text('View All',
                                        style: TextStyle(
                                          color: Color(0xff828282),
                                          decoration: TextDecoration.underline,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.33,
                              width: MediaQuery.of(context).size.width,
                              child: mian_listView(),
                            ),
                          ),
                          // ye me ne upar list view k sat connect kia he
                          SizedBox(
                            height: 200,
                            // child: ListView.builder(
                            //   itemBuilder: (context, index) {
                            //     return ExpansionTile(
                            //       title: Text(myWidget[index]),
                            //       children: [
                            //         ListTile(
                            //           title: Text("appbar"),
                            //         ),
                            //         ListTile(
                            //           title: Text("Widget $index.2"),
                            //         ),
                            //         ListTile(
                            //           title: Text("Widget $index.3"),
                            //         ),
                            //       ],
                            //     );
                            //   },
                            //   itemCount: myWidget.length,
                            // ),
                            child: AdvancedTilePage(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
  }

  AppBar appBar() {
    return AppBar(
      // leading: Icon(Icons.sort),
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.sort,
            ),
          );
        },
      ),

      title: Row(
        children: [
          Text('Flutter'),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              'King',
              style: TextStyle(color: Color(0XffFAE114)),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        ),
      ],
      elevation: 0,
      backgroundColor: Color(0Xff0195FF),
    );
  }

  ListView mian_listView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        // itemCount: Fruitdata.length,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.49,
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(children: [
                            Image.asset(
                              url[index],
                              width: MediaQuery.of(context).size.width * 0.37,
                            )
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: Text(fruitname[index],
                              style: TextStyle(fontSize: 12)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(gram[index]),
                              Row(
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    size: 15,
                                  ),
                                  Text(money[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: MaterialButton(
                            color: Color(0XffFEBC2E),
                            minWidth: MediaQuery.of(context).size.width * 0.02,
                            height: MediaQuery.of(context).size.height * 0.03,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FruitData_full_Detail(
                                    fruitDataModel: Fruitdata[index],
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wrap_text_outlined,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text('Free',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // child: Container(
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: image,
                    //         fit: BoxFit.contain,
                    //       ),
                    //       borderRadius: BorderRadius.circular(20)),
                    // ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Padding main_card(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.07,
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.apps,
                color: Colors.black,
              ),
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.black,
              ),
              hintText: title,
              hintStyle: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }

}
