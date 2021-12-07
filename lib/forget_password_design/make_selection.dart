import 'package:flutter/material.dart';

class makeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'MAKE ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'SELECTION ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Select when contact detail should we use to reset your password?',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Color(0XffEEF1F6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mobile_friendly,
                        size: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text('via mail'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Text('qaiser@mail.com'),
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Color(0XffEEF1F6),
                  child: Row(children: [
                    Icon(
                      Icons.mobile_friendly,
                      size: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text('via sms'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8),
                          child: Text('+923351956201'),
                        ),
                      ],
                    )
                  ]))
            ],
          ),
        ));
  }
}
