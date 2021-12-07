
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_king/expendable_list/page/advanced_tile_page.dart';

// Future main() async {
//   SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   static final String title = 'Expansion Tile';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: MainPage(),
//       );
// }

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int index = 0;

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: AdvancedTilePage(),
//         // body: mainLogin_form(),
//       );
// }
