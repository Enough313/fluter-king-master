// import 'dart:async';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_king_master/check_internet_connection/connectivity_provider.dart';
// import 'package:flutter_king_master/expendable_list/page/advanced_tile_page.dart';
// import 'package:flutter_king_master/main_listView_folder/ListView_All_detail.dart';
// import 'package:flutter_king_master/main_listView_folder/detail_page/fruit_full_detail.dart';
// import 'package:flutter_king_master/main_listView_folder/firestore_data_listview/full_daa_listview.dart';
// import 'package:flutter_king_master/main_listView_folder/full_listview.dart';
// import 'package:flutter_king_master/model/Drawer.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';

// class flutter_king_home extends StatefulWidget {
//   @override
//   State<flutter_king_home> createState() => _flutter_king_homeState();
// }

// class _flutter_king_homeState extends State<flutter_king_home> {
//   int _currentIndex = 0;
//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ConnectivityProvider>(context, listen: false).startMoitoring();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return pageUI();

//     return Scaffold(
//       // drawer: drawer_item(),

//       appBar: appBar(),

//       backgroundColor: Color(0Xff0195FF),
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Align(
//                       alignment: Alignment.topCenter,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Welcome to ',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             'Flutter King ',
//                             style: TextStyle(
//                                 color: Color(0Xff0072C1),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Text('Awesome UI + Code Free',
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 10),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       // builder: (context) => my_listView()));
//                                       builder: (context) => ListPage()));
//                             },
//                             child: Text('View All',
//                                 style: TextStyle(
//                                   color: Color(0xff828282),
//                                   decoration: TextDecoration.underline,
//                                 )),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8),
//                     child: SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.33,
//                       width: MediaQuery.of(context).size.width,
//                       child: mian_listView(),
//                     ),
//                   ),
//                   // ye me ne upar list view k sat connect kia he
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.25,
//                     // child: ListView.builder(
//                     //   itemBuilder: (context, index) {
//                     //     return ExpansionTile(
//                     //       title: Text(myWidget[index]),
//                     //       children: [
//                     //         ListTile(
//                     //           title: Text("appbar"),
//                     //         ),
//                     //         ListTile(
//                     //           title: Text("Widget $index.2"),
//                     //         ),
//                     //         ListTile(
//                     //           title: Text("Widget $index.3"),
//                     //         ),
//                     //       ],
//                     //     );
//                     //   },
//                     //   itemCount: myWidget.length,
//                     // ),
//                     child: ExpandableList(),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   ListView mian_listView() {
//     return ListView.builder(
//         scrollDirection: Axis.horizontal,
//         // itemCount: Fruitdata.length,
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return Container(
//             width: MediaQuery.of(context).size.width * 0.5,
//             child: Column(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.49,
//                   height: MediaQuery.of(context).size.height * 0.33,
//                   child: Card(
//                     elevation: 2,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Stack(children: [
//                             Image.asset(
//                               url[index],
//                               width: MediaQuery.of(context).size.width * 0.37,
//                             )
//                           ]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10, right: 5),
//                           child: Text(fruitname[index],
//                               style: TextStyle(fontSize: 12)),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10, right: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(gram[index]),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.attach_money,
//                                     size: 15,
//                                   ),
//                                   Text(money[index],
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 25, right: 25),
//                           child: MaterialButton(
//                             color: Color(0XffFEBC2E),
//                             minWidth: MediaQuery.of(context).size.width * 0.02,
//                             height: MediaQuery.of(context).size.height * 0.03,
//                             onPressed: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => FruitData_full_Detail(
//                                     fruitDataModel: Fruitdata[index],
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.wrap_text_outlined,
//                                   color: Colors.white,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 5),
//                                   child: Text('Free',
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     // child: Container(
//                     //   decoration: BoxDecoration(
//                     //       image: DecorationImage(
//                     //         image: image,
//                     //         fit: BoxFit.contain,
//                     //       ),
//                     //       borderRadius: BorderRadius.circular(20)),
//                     // ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   Padding main_card(BuildContext context, String title) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 5, right: 5),
//       child: Container(
//         margin: EdgeInsets.only(top: 10),
//         height: MediaQuery.of(context).size.height * 0.07,
//         child: TextField(
//           enabled: false,
//           decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               prefixIcon: Icon(
//                 Icons.apps,
//                 color: Colors.black,
//               ),
//               suffixIcon: Icon(
//                 Icons.keyboard_arrow_down_sharp,
//                 color: Colors.black,
//               ),
//               hintText: title,
//               hintStyle: TextStyle(color: Colors.black)),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class flutter_king_home extends StatefulWidget {
  @override
  _flutter_king_homeState createState() => _flutter_king_homeState();
}

class _flutter_king_homeState extends State<flutter_king_home> {
  static List<String> otp_item = [
    'OTP',
    'SignIn',
    'Signup',
    'OTP',
    'SignIn',
    'Signup',
  ];
  static List<String> name_item = [
    'Flutter UI + Firebase',
    'Flutter UI + Firebase',
    'Flutter UI + Firebase',
    'Flutter UI + Firebase',
    'Flutter UI + Firebase',
    'Flutter UI + Firebase',
  ];
  static List imageurl = [
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
  ];
  final List<AllDataModel> itemData = List.generate(
      name_item.length,
      (index) => AllDataModel(
          '${otp_item[index]}', '${name_item[index]}', '${imageurl[index]}'));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffFFD700),
        appBar: appBar(context),
        body:
         Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: const [
                  Text(
                    'Hi! Choose',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' awesome UI',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Code for ListView
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: SizedBox(
                height: 190,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: name_item.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.27,
                            width: MediaQuery.of(context).size.width * 0.37,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Card(
                              //  elevation: 20,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                      onTap: () {
                                        SnackBar snackBar = SnackBar(
                                            content:
                                                Text("Tapped : ${index + 1}"));

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      title: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            itemData[index].imageurl,
                                            height: 80,
                                            width: 100,
                                          ),
                                          Text(
                                            itemData[index].otp,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff022C43)),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                            child: Divider(
                                              color: Colors.yellow,
                                              thickness: 3,
                                            ),
                                          ),
                                          Text(
                                            itemData[index].name,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),

            // code for half page Container
            Container(
              height: MediaQuery.of(context).size.height * 0.4465,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xffF2F4F3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  //  code for search
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 13, left: 15, right: 8, bottom: 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(),
                              //   prefixIcon: Icon(Icons.search,color: Color(0xffEFB176),),
                              hintText: 'Search ',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'Flutter Basic to advance',
                            style: TextStyle(color: Color(0xff022C43)),
                          ),
                        ),
                      ],
                    ),
                  ),

// Expendable list view
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.305,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                      itemCount: vehicles.length,
                      itemBuilder: (context, i) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ExpansionTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vehicles[i].title,
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff022C43)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Pay once you got order at your home',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              Column(
                                children: _buildExpandableContent(vehicles[i]),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
         leading: IconButton(
            onPressed: () {
              return showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  transitionDuration: Duration(microseconds: 200),
                  barrierLabel: MaterialLocalizations.of(context).dialogLabel,
                  barrierColor: Colors.black.withOpacity(0.5),
                  pageBuilder: (
                    context,
                    _,
                    __,
                  ) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: Colors.white,
                          child: Card(
                              child: ListView(
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('adsjflaksdjfk'),
                                      Text('ldasjlkfjl'),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: Text('alsdjflksda'))
                                    ],
                                  )),
                              Text('alfdskj'),
                              Text('alfdskj'),
                              Text('alfdskj'),
                              Text('alfdskj'),
                              Text('alfdskj'),
                              Text('alfdskj'),
                              Text('alfdskj'),
                            ],
                          )),
                        ),
                      ],
                    );
                  },
                  transitionBuilder:
                      (context, animation, secondaryanimation, child) {
                    return SlideTransition(
                        position: CurvedAnimation(
                                parent: animation, curve: Curves.easeInOutCubic)
                            .drive(Tween<Offset>(
                                begin: Offset(0, -1.0), end: Offset.zero)));
                  });
              // Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.sort)),
        
        elevation: 0,
        backgroundColor: Color(0xffFFD700),
        title: Row(
          children: const [
            Text(
              'Flutter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '  King',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
       );
  }
}

// code for expandable list view
_buildExpandableContent(Wgtclass wgtveriable) {
  List<Widget> columnContent = [];

  for (String content in wgtveriable.contents) {
    columnContent.add(
      ListTile(
        title: Text(
          content,
          style: const TextStyle(fontSize: 18.0),
        ),
        // leading: Icon(vehicle.icon),
      ),
    );
  }

  return columnContent;
}

class Wgtclass {
  final String title;
  List<String> contents = [];
  //final IconData icon;

  Wgtclass(
    this.title,
    this.contents,
  ); //this.icon);
}

List<Wgtclass> vehicles = [
  Wgtclass(
    'Widgets',
    ['Widget no. 1', 'Widget  no. 2', 'Widget  no. 3'],
    // Icons.motorcycle,
  ),
  Wgtclass(
    'Widgets',
    ['Widget no. 1', 'Widget  no. 2', 'Widget  no. 3'],
    // Icons.motorcycle,
  ),
  Wgtclass(
    'Widgets',
    ['Widget no. 1', 'Widget  no. 2', 'Widget  no. 3'],
    // Icons.motorcycle,
  ),
];

class AllDataModel {
  String name, otp, imageurl;
  AllDataModel(this.otp, this.name, this.imageurl);
}
