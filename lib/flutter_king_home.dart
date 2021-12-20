import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_king_master/main_listView_folder/firestore_data_listview/detail_page.dart';
import 'package:flutter_king_master/main_listView_folder/fruitDataModel/widget_detailPage/all_widgetDetail.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class flutter_king_home extends StatefulWidget {
  static const id = "flutter_king_home";

  @override
  _flutter_king_homeState createState() => _flutter_king_homeState();
}

class _flutter_king_homeState extends State<flutter_king_home> {
  final firebase = FirebaseFirestore.instance.collection('screen');

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xffFFD700),
          appBar: AppBar(
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
          ),

          // code for drawer
          drawer: drawer(),
          body: SingleChildScrollView(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints maxSize) {
              print('height: $height');
              if (height > 1280) {
                height = MediaQuery.of(context).size.height / 4;
              } else if (height > 960) {
                height = MediaQuery.of(context).size.height / 2.5;
              } else if (height >= 1920) {
                height = MediaQuery.of(context).size.height / 1.2;
              } else if (height <= 960) {
                height = MediaQuery.of(context).size.height / 2.7;
              }
              return Column(
                children: [
                  //  Container 1 for first half page
                  Container(
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
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
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                            child: SizedBox(
                                height: 190,
                                width: double.infinity,
                                child: StreamBuilder(
                                    stream: firebase.snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData) {
                                        Fluttertoast.showToast(
                                            msg: 'No Data found');
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.blue,
                                          ),
                                        );
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.blue,
                                          ),
                                        );
                                      }
                                      final value = snapshot.data.docs;
                                      return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 4,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 180,
                                                  width: 130,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Card(
                                                    //  elevation: 20,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        ListTile(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushNamed(
                                                                DetailPage.id,
                                                                arguments: {
                                                                  "image": value[
                                                                          index]
                                                                      ['image'],
                                                                  "description":
                                                                      value[index]
                                                                          [
                                                                          'description'],
                                                                },
                                                              );
                                                            },
                                                            title: Column(
                                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Image(
                                                                  image: CachedNetworkImageProvider(
                                                                      value[index]
                                                                          [
                                                                          'image']),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  height: 80,
                                                                  width: 100,
                                                                ),
                                                                Text(
                                                                  value[index][
                                                                      'description'],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Color(
                                                                          0xff022C43)),
                                                                ),
                                                                const SizedBox(
                                                                  width: 50,
                                                                  child:
                                                                      Divider(
                                                                    color: Colors
                                                                        .yellow,
                                                                    thickness:
                                                                        3,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Futter UI + Firebase',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    })),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Code for ListView

                  //  Container 2 for second half page
                  Container(
                    height: MediaQuery.of(context).size.height / 1.935,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xffF2F4F3),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  code for search
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              width: 330,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(),
                                      //   prefixIcon: Icon(Icons.search,color: Color(0xffEFB176),),
                                      hintText: 'Search ',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: const Text(
                              'Flutter Basic to advance',
                              style: TextStyle(
                                color: Color(0xff022C43),
                              ),
                            ),
                          ),

                          // Expendable list view
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.330,
                              width: 335,
                              child: StreamBuilder(
                                stream: firebase.snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    FlutterToastr.show(
                                        'No Data Found', context);
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.blue,
                                      ),
                                    );
                                  }

                                  final value = snapshot.data.docs;
                                  return ListView.builder(
                                    itemCount: vehicles.length,
                                    itemBuilder: (context, i) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return AllWidgets();
                                          }));
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: ExpansionTile(
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  vehicles[i].title,
                                                  style: const TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff022C43)),
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    'Pay once you got order at your home',
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            children: <Widget>[
                                              Column(
                                                children:
                                                    _buildExpandableContent(
                                                        vehicles[i]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ));
  }

  Drawer drawer() {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        color: Color(0xff02283C),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 330,
              decoration: BoxDecoration(
                  color: Color(0xff02283C),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.yellow, fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xffEBC905),
                      ),
                      hintText: 'Flutter King ',
                      // suffixIcon:Icon(Icons.clear) ,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)))),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'An app Showcasing Flutter compunets, with side-by-side source code view',
                style: TextStyle(color: Colors.yellow, fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 35, 8, 8),
              child: Text(
                'Develop by : Enoughtechnology.com',
                style: TextStyle(color: Colors.yellow, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
              child: Row(
                children: const [
                  Icon(
                    Icons.play_circle_outlined,
                    color: Colors.yellow,
                  ),
                  Text(
                    '  Rate on Play Stor',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 35, 5, 5),
              child: Text(
                'Visit Enough Technology',
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
              child: Row(
                children: [
                  Icon(
                    Icons.nightlight_round,
                    color: Colors.yellow,
                    size: 30,
                  ),
                  Text(
                    'Dark mode',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.white,
                    activeColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
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
