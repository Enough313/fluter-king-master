import 'package:flutter/material.dart';

class expandable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
      itemBuilder: (context, i) {
        return ExpansionTile(
          title: Text("List tile $i"),
          children: [
            ListTile(
              title: Text("List tile $i.1"),
            ),
            ListTile(
              title: Text("List tile $i.2"),
            ),
            ListTile(
              title: Text("List tile $i.3"),
            )
          ],
        );
      },
      itemCount: 100,
    )
    );
  }
}
