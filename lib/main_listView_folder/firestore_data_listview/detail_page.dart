import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final data;
  DetailPage(QueryDocumentSnapshot<Object> document, {this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Card(
                child: Column(
                  children: [
                    // Image.network(data['image']),
                    Text(
                      data['description'],
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )

              // Card(
              //   child: Container(
              //     child: Image.network(data['image']),
              //   ),
              // ),
              // SizedBox(
              //   height: 8,

              // ),
              // Card(
              //   child:Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              //   child: Text(data['description'],style: TextStyle(fontSize: 20),),
              //   )
              // ),
            ],
          )
        ],
      ),
    );
  }
}
