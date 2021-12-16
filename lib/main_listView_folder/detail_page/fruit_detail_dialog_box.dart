
// another class is class me listview image show ga our description b show ho ga
import 'package:flutter/material.dart';
import 'package:flutter_king_master/main_listView_folder/fruitDataModel/FruitDataMedol.dart';

class FruitDetail extends StatelessWidget {
  final FruitDataModel fruitDataModel;
  const FruitDetail({ Key key,    this.fruitDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(fruitDataModel.image),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }
}
