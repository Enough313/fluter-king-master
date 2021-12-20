

import 'package:flutter_king_master/bottom_navigation_item/Q&A/modelClass.dart';

List<String> question  = [
    'What is Flutter',
    'What is pubspec.yaml file?',
    'What is Flutter',
    'What is pubspec.yaml file?',
   
  ];
   List<String> answer= [
  'Receive The Newsletter Flutter is a Ul toolkit for creating fast, beautiful, natively compiled mobile applications with one programming language and a single codebase. It is an open-source development framework developed by Google. Generally, Flutter is not a language; it is an SDK.',
  "It is the project's configuration file that will use a lot during working with the Flutter project. It allows you how your application works. It also allows us to set the constraints for the app. This file contains:Project general settings such as name, description, and version of the project.Project dependencies. Project assets (e.g., images, audio, etc.).",
  "Receive The Newsletter Flutter is a Ul toolkit for creating fast, beautiful, natively compiled mobile applications with one programming language and a single codebase. It is an open-source development framework developed by Google. Generally, Flutter is not a language; it is an SDK.",
  "It is the project's configuration file that will use a lot during working with the Flutter project. It allows you how your application works. It also allows us to set the constraints for the app. This file contains:Project general settings such as name, description, and version of the project.Project dependencies.Project assets (e.g.. images, audio, etc.)."
  
  ];
 List imageurl = [
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
    'images/flutter_ui_pic.png',
  ];
  final List<AllDataModel> itemData = List.generate(
      question.length,
          (index) => AllDataModel('${question[index]}','${answer[index]}','${imageurl[index]}')
  );