import 'package:flutter/material.dart';

class Forget_passwrod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Icon(
                Icons.lock,
                size: MediaQuery.of(context).size.width * 0.25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Forget Password',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Provide your account email for which you want to reset your password',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MaterialButton(
                onPressed: () {},
                child: Text('NEXT'),
                color: Color(0XffF8E014),
                minWidth: double.infinity,
              ),
            )
          ],
        ));
  }
}
