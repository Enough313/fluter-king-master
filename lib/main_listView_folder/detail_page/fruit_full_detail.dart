import 'package:flutter/material.dart';
import 'package:flutter_king_master/main_listView_folder/fruitDataModel/FruitDataMedol.dart';

class FruitData_full_Detail extends StatelessWidget {
  final FruitDataModel fruitDataModel;
  const FruitData_full_Detail({ Key key,    this.fruitDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(fruitDataModel.name),
          bottom: TabBar(
            tabs: [
            Tab(child: Text('image')),
              Tab(child: Text('code')),
            ],
          ),
        ),
        body: Container(
          child: TabBarView( children: [
              Center(
                child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(fruitDataModel.image),
                      // child: Image.network(snapth),
                    ),

              ),
              Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        fruitDataModel.description,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
            ]
),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Image.asset(fruitDataModel.ImageUrl),
//                   ),
                  

// //  ye niche code datamodel see descriptino ko laye ga

//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: Text(
//                       fruitDataModel.desc,
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
        ),
      ),
    );
  }
}