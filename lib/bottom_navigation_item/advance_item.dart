import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:share/share.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

class advance_page extends StatefulWidget {
  @override
  State<advance_page> createState() => _advance_pageState();
}

class _advance_pageState extends State<advance_page> with SingleTickerProviderStateMixin {
  var myData = {
    'his plugin has been replaced by the Flutter Community Plus Plugins version, share_plus. No further updates are planned to this plugin, and we encourage all users to migrate to the Plus version.Critical fixes (e.g., for any security incidents) will be provided through the end of 2021, at which point this package will be marked as discontinued.'
  };

  bool _visible = true;
  void setDialVisible(bool value) {
    setState(() {
      _visible = value;
    });
  }

  SpeedDial _speedDial() {
    return SpeedDial(
      // child: Icon(Icons.add),
      animatedIcon: AnimatedIcons.menu_close,

      animatedIconTheme: IconThemeData(size: 24),
      onOpen: () {},
      onClose: () {},
      curve: Curves.easeInBack,
      visible: _visible,
      children: [
        SpeedDialChild(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
            labelBackgroundColor: Colors.red,
            labelStyle: TextStyle(color: Colors.red),
            onTap: () {
              FlutterToastr.show('Share now', context);
              Share.share(
                myData.toString(),
              );
            }),
        SpeedDialChild(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.copy,
              color: Colors.white,
            ),
            // labelBackgroundColor: Colors.black,
            labelStyle: TextStyle(color: Colors.white),
            onTap: () {
              FlutterToastr.show('successfuly copy', context);
              FlutterClipboard.copy(myData.toString());
            }),
        SpeedDialChild(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
            // labelBackgroundColor: Colors.black,
            labelStyle: TextStyle(color: Colors.white),
            onTap: () {}),
        SpeedDialChild(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.zoom_out,
              color: Colors.white,
            ),
            // labelBackgroundColor: Colors.black,
            labelStyle: TextStyle(color: Colors.white),
            onTap: () {}),
      ],
    );
  }

  final isDialOpen = ValueNotifier(false);

  // final double minScale = 1;
  // final double maxScale = 4;
  // late TransformationController controller;
  // late AnimationController animationController;
  // Animation<Matrix4>? animation;

  // @override
  // void initState() {
  //   super.initState();
  //   // TODO: implement initState
  //   controller = TransformationController();
  //   animationController =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // onWillPop:
    // () async {
    //   if (isDialOpen.value) {
    //     //close spee dial
    //     isDialOpen.value = false;
    //     return false;
    //   } else {
    //     return true;
    //   }
    // };
    return Scaffold(
      floatingActionButton: _speedDial(),
      body: Column(
        children: [
          InteractiveViewer(
            clipBehavior: Clip.none,
            // minScale: minScale,
            // maxScale: maxScale,
            // transformationController: controller,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(myData.toString()),
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: SpeedDial(
      //   // animatedIcon: AnimatedIcons.menu_close,
      //   overlayOpacity: 0.4,
      //   overlayColor: Colors.black,
      //   backgroundColor: Colors.black,

      //   spacing: 12,
      //   spaceBetweenChildren: 12,
      //   closeManually: true,
      //   onOpen: () {},
      //   onClose: () {},
      //   openCloseDial: isDialOpen,
      //   children: [
      //     SpeedDialChild(child: Icon(Icons.mail), onTap: () {}),
      //     SpeedDialChild(child: Icon(Icons.copy), onTap: () {}),
      //     SpeedDialChild(child: Icon(Icons.share), onTap: () {}),
      //   ],
      // ),
    );
  }
}
