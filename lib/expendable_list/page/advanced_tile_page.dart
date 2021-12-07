import 'package:flutter/material.dart';
import 'package:flutter_king_master/expendable_list/data/advanced_tiles.dart';
import 'package:flutter_king_master/expendable_list/model/advanced_tile.dart';

import '../../detail_widget_class.dart';

class AdvancedTilePage extends StatefulWidget {
  @override
  _AdvancedTilePageState createState() => _AdvancedTilePageState();
}

class _AdvancedTilePageState extends State<AdvancedTilePage> {

  @override
  Widget build(BuildContext context) => Scaffold(
        
        body: SingleChildScrollView(
          child: ExpansionPanelList.radio(
            expansionCallback: (index, isExpanded) {
              final tile = advancedTiles[index];
              setState(() => tile.isExpanded = isExpanded);
            },
            children: advancedTiles
                .map((tile) => ExpansionPanelRadio(
                      value: tile.title,
                      // canTapOnHeader: false,
                      headerBuilder: (context, isExpanded) => buildTile(tile),
                      body: Column(
                        children: tile.tiles.map(buildTile).toList(),
                      ),
                    ))
                .toList(),
          ),
        ),
      );

 
  Widget buildTile(AdvancedTile tile) => ListTile(
      leading: tile.icon != null
          ? Icon(
              tile.icon,
              color: Colors.black.withOpacity(0.7),
            )
          : null,
      title: Text(tile.title),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Widget_detail()));
      });
}
