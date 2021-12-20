import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_king_master/main_listView_folder/firestore_data_listview/detail_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';

class flutter_king_home extends StatefulWidget {
  static const id = "/flutter_king_home";
  @override
  _flutter_king_homeState createState() => _flutter_king_homeState();
}

class _flutter_king_homeState extends State<flutter_king_home> {
  final firebase = FirebaseFirestore.instance.collection('screen');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xffFFD700),
          appBar: appBar(context),
          body: Column(
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                  stream: firebase.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    // if(snapshot.error){
                    //   Fluttertoast.showToast(msg: 'error');
                    // }
                    if (!snapshot.hasData) {
                      Fluttertoast.showToast(msg: 'No data found');
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.blue,
                      ));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.blue,
                      ));
                    }
                    final value = snapshot.data.docs;

                    return Container(
                      decoration: BoxDecoration(),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.38,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  DetailPage.id,
                                  arguments: {
                                    "image": value[index]['image'],
                                    "description": value[index]['description'],
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),

                                        // child: Image(
                                        //     image: CachedNetworkImageProvider(
                                        //   values[index]['image'][0],
                                        // )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            child: Image(
                                              image: CachedNetworkImageProvider(
                                                  value[index]['image']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                        // child:CachedNetworkImageProvider()
                                        // child: Image.network(
                                        //   values[index]['imagesUrl'][0],
                                        //   fit: BoxFit.cover,
                                        //   height: 200,
                                        //   width: 200,
                                        // ),
                                        ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(value[index]['description'],
                                          style: TextStyle(
                                              color: Color(0XffF7E32D),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0XffF7E32D),
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .005,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text('Flutter UI + Firebase',
                                          style: TextStyle(
                                              color: Color(0Xff2D5063),
                                              fontWeight: FontWeight.bold))

                                      // Positioned(
                                      //   //top: 0,
                                      //   bottom: 0,
                                      //   right: 0,
                                      //   left: 0,
                                      //   child: Container(
                                      //     alignment: Alignment.center,
                                      //     width: double.infinity,
                                      //     decoration: BoxDecoration(
                                      //       color: Colors.black87,
                                      //     ),
                                      //     child: Center(
                                      //       child: Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceEvenly,
                                      //         children: [
                                      //           Expanded(
                                      //             child:
                                      //                 Text(values[index]['productName'],
                                      //                     textAlign: TextAlign.center,
                                      //                     style: TextStyle(
                                      //                       color: Colors.white,
                                      //                       fontSize: 15,
                                      //                     )),
                                      //           ),
                                      //           Expanded(
                                      //             child: IconButton(
                                      //               onPressed: () {},
                                      //               icon:
                                      //                   Icon(FontAwesomeIcons.cartPlus),
                                      //               color:Colors.white,
                                      //               iconSize: 20,
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      ,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3793,
                decoration: BoxDecoration(
                    color: Color(0Xff022C43),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(),
                                  //   prefixIcon: Icon(Icons.search,color: Color(0xffEFB176),),
                                  hintText: 'Search ',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 8, bottom: 4),
                        child: Row(
                          children: const [
                            Text(
                              'Flutter Basic to advance',
                              style: TextStyle(color: Color(0xffD5BB0B)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.24,
                        width: MediaQuery.of(context).size.width,
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
                                            fontSize: 12.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Column(
                                    children:
                                        _buildExpandableContent(vehicles[i]),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
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
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
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
