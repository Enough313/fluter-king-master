import 'package:flutter/material.dart';

import 'expendable_list/model/advanced_tile.dart';

class Widget_detail extends StatefulWidget {
  //  final AdvancedTile advancedTile;
  // const Widget_detail({ Key? key, required this.advancedTile}) : super(key: key);

  @override
  State<Widget_detail> createState() => _Widget_detailState();
}

class _Widget_detailState extends State<Widget_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Text(' Expandable data page ')
      )
      
    );
  }
}