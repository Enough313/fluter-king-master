import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_king_master/main_listView_folder/firestore_data_listview/detail_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final CollectionReference firebase =
      FirebaseFirestore.instance.collection('screen');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: firebase.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data.docs.map(
              (document) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(document)));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(document['image']),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(document['description']),
                        ),
                        Container(
                            width: 50,
                            height: 30,
                            color: Colors.amber,
                            child: Center(child: Text(('Free'))))
                      ],
                    ),

                    // child: ListTile(
                    //   title: Text(
                    //     document['money'],
                    //   ),
                    // ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
