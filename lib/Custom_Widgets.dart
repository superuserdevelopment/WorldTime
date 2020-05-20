import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:worldtime/pages/home.dart';


class clockWidget extends StatefulWidget {
  Duration offset;
  String title;

  clockWidget(Duration d, String t){
    offset = d;
    title = t;
  }
  @override
  _clockWidgetState createState() => _clockWidgetState(offset: offset,title: title );
}

class _clockWidgetState extends State<clockWidget> {
  Duration offset;
  String title;
  DateTime UI = DateTime.now();
  _clockWidgetState({this.offset, this.title});

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        UI = DateTime.now().toUtc().add(offset);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Container(
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('${title}',
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Merriweather'),),
              SizedBox(height: 10.0,),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 3.0,
                      color: Colors.white
                    )
                  ]
                ),
                child: FlutterAnalogClock(
                  dateTime: DateTime.now().toUtc().add(offset),
                  dialPlateColor: Colors.white,
                  hourHandColor: Colors.black,
                  minuteHandColor: Colors.black,
                  secondHandColor: Colors.black,
                  numberColor: Colors.black,
                  borderColor: Colors.black,
                  tickColor: Colors.black,
                  centerPointColor: Colors.black,
                  showBorder: true,
                  showTicks: true,
                  showMinuteHand: true,
                  showSecondHand: true,
                  showNumber: false,
                  borderWidth: 4.0,
                  hourNumberScale: 0.75,
                  hourNumbers: ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII'],
                  isLive: true,
                  width: 200.0,
                  height: 200.0,
                  decoration: const BoxDecoration(),

                ),
              ),
              SizedBox(height: 10.0,),
              Text('${UI.toIso8601String().substring(11,19)}',
                style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Merriweather'),),
            ],
          ),
        ),
      ),
    );
  }
}

class MainClockWidget extends StatefulWidget {
  Duration offset;
  String title;
  MainClockWidget(Duration d, String t){
    offset = d;
    title = t;
  }

  @override
  _MainClockWidgetState createState() => _MainClockWidgetState(offset: offset,title: title);
}

class _MainClockWidgetState extends State<MainClockWidget> {
  Duration offset;
  String title;
  DateTime UI = DateTime.now();
  _MainClockWidgetState({this.offset, this.title});

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        UI = DateTime.now().toUtc().add(offset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        height: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text('${title}',
              style: TextStyle(color: Colors.white, fontSize: 30),),
            SizedBox(height: 10.0,),
            Container(
              height: 250,
              child: FlutterAnalogClock(
                dateTime: DateTime.now().toUtc().add(offset),
                dialPlateColor: Colors.white,
                hourHandColor: Colors.black,
                minuteHandColor: Colors.black,
                secondHandColor: Colors.black,
                numberColor: Colors.black,
                borderColor: Colors.black,
                tickColor: Colors.black,
                centerPointColor: Colors.black,
                showBorder: false,
                showTicks: true,
                showMinuteHand: true,
                showSecondHand: true,
                showNumber: true,

              ),
            ),
            SizedBox(height: 10.0,),
            Text('${UI.toIso8601String().substring(11,19)}',
              style: TextStyle(color: Colors.white, fontSize: 24),),
          ],
        ),
      ),
    );
  }
}

