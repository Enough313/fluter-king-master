import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_king_master/main_listView_folder/ListView_All_detail.dart';
import 'package:flutter_king_master/main_listView_folder/detail_page/fruit_detail_dialog_box.dart';
import 'package:flutter_king_master/main_listView_folder/detail_page/fruit_full_detail.dart';
import 'package:flutter_king_master/model/Drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

class my_listView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer_item(),
      appBar: appbar(),
      body: mian_listView(),

      // streambuilder hod hi build hota jo data db me aye ga o hod load hota he latest snapshot k base par
      // body: StreamBuilder(
      //   // stream define karta he  k kaha see data la raha he
      //   stream: FirebaseFirestore.instance.collection('screen').snapshots(),
      //   //
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(child: Text('No data Exit'));
      //     }

      //     // yaha par set kia k agr data loading ho raha he to waiting kare ga
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //     // return Text('${snapshot.data.docs[0]['Price']}');  // ye single data ko retrieve kartahe
      //     return ListView.builder(
      //       itemCount: snapshot.data.docs.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return Padding(
      //           padding: const EdgeInsets.all(15.0),
      //           child: Container(
      //               decoration: BoxDecoration(
      //                   color: Colors.grey.shade200,
      //                   borderRadius: BorderRadius.circular(20)),
      //               child: Column(
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child:
      //                         Image.network(snapshot.data.docs[index]['image']),
      //                   ),
      //                   Text(snapshot.data.docs[index]['description']),
      //                   ElevatedButton(onPressed: () {}, child: Text('Free'))
      //                 ],
      //               )),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}

ListView mian_listView() {
  return ListView.builder(
    itemCount: Fruitdata.length,
    itemBuilder: (context, index) {
      return Container(
        width: double.infinity,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                          onTap: () {
                            show_dialogBox(context);
                          },
                          child: Image.asset(url[index])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, top: 8),
                      child: Text(fruitname[index]),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FruitData_full_Detail(
                                  fruitDataModel: Fruitdata[index],
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Free',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0XffFFBD2E),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      );
    },
  );
}

AppBar appbar() {
  return AppBar(
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
    title: Text('Otp Ui Design'),
  );
}

Future<dynamic> show_dialogBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CarouselSlider.builder(
                itemCount: Fruitdata.length,
                itemBuilder: (BuildContext context, int index, int page) {
                  return Container(
                    child: FruitDetail(fruitDataModel: Fruitdata[index]),
                  );
                },
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height * 0.6,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.easeInOutSine),
              ),
            ),
          ],
        );
      });
}
