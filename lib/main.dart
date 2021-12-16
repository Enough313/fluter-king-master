import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_king_master/bottom_navigation_item/bottom_navigation.dart';
import 'package:flutter_king_master/check_internet_connection/connectivity_provider.dart';
import 'package:provider/provider.dart';

// --no-sound-null-safety;
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(king_flutter());
}

class king_flutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     // body: Forget_passwrod(),
    //     // body: makeSelection(),
    //     // body: flutter_king_home(),
    //     // body: expandable(),
    //     // body: flutter_king_home(),
    //     body: navigation(),
    //   // body: login(),
    //   ),
    // );

     return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ConnectivityProvider(),
            child: navigation(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: navigation(),
        ));
  }
}

