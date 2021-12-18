import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_king_master/main_listView_folder/firestore_data_listview/detail_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListPage extends StatefulWidget {
  static const id = "/listpage";
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final firebase = FirebaseFirestore.instance.collection('screen');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: StreamBuilder(
        stream: firebase.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            Fluttertoast.showToast(msg: "error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final values = snapshot.data.docs;
          return values.length > 0
              ? ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            DetailPage.id,
                            arguments: {
                              "image": values[index]['image'],
                              "description": values[index]['description'],
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Color(0Xff777777),
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
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: Image.network(values[index]['image'],
                                        fit: BoxFit.cover),
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
                                child: Text(values[index]['description'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Color(0XffFFBD2E),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text('Free',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              )

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
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    'no product found',
                  ),
                );

       
        },
      ),
    );
  }
}
