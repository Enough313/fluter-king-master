import 'package:flutter_king_master/main_listView_folder/fruitDataModel/FruitDataMedol.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_king_master/main_listView_folder/fruitDataModel/FruitDataMedol.dart';
import 'package:flutter_king_master/main_listView_folder/fruitDataModel/FruitDataMedol.dart';
// StreamBuilder(
//       // stream define karta he  k kaha see data la raha he
//       stream: FirebaseFirestore.instance.collection('dummy data').snapshots(),
//       //
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return Center(child: Text('No data Exit'));
//         }
//         // yaha par set kia k agr data loading ho raha he to waiting kare ga
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         // return Text('${snapshot.data.docs[0]['Price']}');  // ye single data ko retrieve kartahe
//         return ListView.builder(
//           itemCount: snapshot.data.docs.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               decoration: BoxDecoration(color: Colors.green.shade300 , borderRadius: BorderRadius.circular(20)),
//               child: Column(

//               children: [

//                Image.network(snapshot.data.docs[index]['images']),
//                 Text(snapshot.data.docs[index]['P Nanem']),
//                 Text(snapshot.data.docs[index]['Price']),
//                 Text(snapshot.data.docs[index]['Quality']),
//               ],
//             ));
//           },
//         );
//       },
//     ),

final List gram = ['250 g', '300 g', '100 g', '270 g', '230 g'];
// final  List gram = [
  
    
//     StreamBuilder(
//       // stream define karta he  k kaha see data la raha he
//       stream: FirebaseFirestore.instance.collection('screen').snapshots(),
      
//       //
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return Center(child: Text('No data Exit'));
//         }
        
//         // yaha par set kia k agr data loading ho raha he to waiting kare ga
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         // return Text('${snapshot.data.docs[0]['Price']}');  // ye single data ko retrieve kartahe
//         return ListView.builder(
//           itemCount: snapshot.data.docs.length,
//           itemBuilder: ( context,  index) {
//             return Text(snapshot.data.docs[index]['gram'][0]);
//           },
//         );
//       },
//     ),
  
// ];

final List money = ['30', '35', '76', '27', '23'];
final List<String> fruitname = [
  'Yellow Capsicum (Fresh)',
  'Yellow Capsicum (Fresh)',
  'Yellow Capsicum (Fresh)',
  'Yellow Capsicum (Fresh)',
  'Yellow Capsicum (Fresh)'
];

final List url = [
  'photo/otp1.jpg',
  'photo/otp1.jpg',
  'photo/task5.png',
  'photo/gig3.jpg',
  'photo/gig3.jpg',
  'photo/gig3.jpg',
];


//   Map toMap(FruitDataModel user) {
//     var data = Map<String, dynamic>();

//     data["description"] = user.description;
//     data["gram"] = user.gram;
//     data["image"] = user.image;
//     data['money'] = user.money;
    
//     return data;
//   }

//   FruitDataModel.fromMap(Map<String, dynamic> mapData) {
//     description = mapData["description"];
//     gram = mapData["username"];
//     image.email = mapData["email"];
//     this.name = mapData["name"];
//     this.isPrivate = mapData["isPrivate"];
//     this.gender = mapData["gender"];
//     this.photoUrl = mapData["photoUrl"];
//     this.bio = mapData["bio"];
//     this.birthday = mapData["birthday"];
//     this.followers = mapData["followers"];
//     this.following = mapData["following"];
//   }
// }

// yaha par conect kia image our text our next activity me b show ho raha he
// final List<FruitDataModel> Fruitdata = List.generate(
//     fruitname.length,
//     (index) => FruitDataModel('${fruitname[index]}', '${url[index]}',
//         '${fruitname[index]} Description...'));
final List<FruitDataModel> Fruitdata = List.generate(
    fruitname.length,
    (index) => FruitDataModel('${fruitname[index]}', '${url[index]}',
        '${fruitname[index]}', '${gram[index]}', '${money[index]}'));
