// import 'package:flutter/material.dart';
// import 'package:flutter_king_master/main_listView_folder/fruitDataModel/FruitDataMedol.dart';

// class DetailPaage extends StatefulWidget {
//   static const id = 'detailpage';
//   @override
//   State<DetailPaage> createState() => _DetailPaageState();
// }

// class _DetailPaageState extends State<DetailPaage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           // title: Text(widget.fruitDataModel.name),
//           title: Text('detail page'),
//           bottom: TabBar(
//             tabs: [
//               Tab(child: Text('image')),
//               Tab(child: Text('code')),
//             ],
//           ),
//         ),
//         body: Container(
//           child: TabBarView(children: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 // child: Image.asset(widget.fruitDataModel.image),

//                 // child: Image.network(snapth),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               // child: Text(
//               //   widget.fruitDataModel.description,
//               //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               // ),
//             )
//           ]),
// //           child: Center(
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.all(15.0),
// //                     child: Image.asset(fruitDataModel.ImageUrl),
// //                   ),

// // //  ye niche code datamodel see descriptino ko laye ga

// //                   Padding(
// //                     padding: const EdgeInsets.only(bottom: 10),
// //                     child: Text(
// //                       fruitDataModel.desc,
// //                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
//         ),
//       ),
//     );
//   }
// }

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
