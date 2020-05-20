import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading_page extends StatefulWidget {
  @override
  _Loading_pageState createState() => _Loading_pageState();
}

class _Loading_pageState extends State<Loading_page> {
  void delay() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed((context), '/home');
  }

  void initState() {
    super.initState();
    delay();
    print('Async kicked in yo!');
  }

  //DateTime utc = DateTime();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SpinKitPouringHourglass(
                    color: Colors.white,
                    size: 200.0,
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'World Time',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Merriweather',
                      fontSize: 50.0
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 300.0,),
            Text(
              'superuserdev',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(height: 30.0,)
          ],
        ));
  }
}
