import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const id = 'productdetail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = 0;
  // int quant = 1;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;

    var description = data['description'];

    var image = data['image'];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('show detial'),
          bottom: TabBar(
            tabs: [
              Tab(child: Text('image')),
              Tab(child: Text('code')),
            ],
          ),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              Container(
                
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image(
                    image: CachedNetworkImageProvider(
                      image,
                    ),
                    fit: BoxFit.cover),
              ),

              // Positioned(
              //     top: 20,
              //     left: 0,
              //     child: Container(
              //       child: IconButton(
              //           onPressed: () {
              //             Navigator.pop(context);
              //           },
              //           icon: Icon(
              //             Icons.arrow_back_ios,
              //             color: Colors.black,
              //           )),
              //     )),
              // Positioned(
              //   bottom: -10,
              //   left: 0,
              //   right: 0,
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         ...List.generate(image.length, (index) {
              //           return Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: InkWell(
              //               onTap: () {
              //                 setState(() {
              //                   selectedIndex = index;
              //                 });
              //                 print(index);
              //               },
              //               child: Container(
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(10),
              //                       border: Border.all(
              //                         color: Colors.deepOrange,
              //                       )),
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(10),
              //                     child: Image(
              //                       image: CachedNetworkImageProvider(
              //                         image[index],
              //                       ),
              //                       height: 50,
              //                       width: 40,
              //                       fit: BoxFit.cover,
              //                     ),
              //                     // child: Image.network(
              //                     //   images[index],
              //                     //   height: 50,
              //                     //   width: 40,
              //                     //   fit: BoxFit.cover,
              //                     // ),
              //                   )),
              //             ),
              //           );
              //         })
              //       ]),
              // ),
            ],
          ),
          Text(description),
        ]),
      ),
    );
  }
}
