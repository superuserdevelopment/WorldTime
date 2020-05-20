import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'dart:async';
import 'package:worldtime/Custom_Widgets.dart';
import 'package:worldtime/services/time_objects.dart';
import 'package:worldtime/services/time_objects.dart';

class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  static DateTime UITime = DateTime.now().toUtc();
  String currentTimeZone = 'Mumbai';
  Duration offset = Duration(hours: 5, minutes: 30);
  List<CountryTime> clocks1 = [
    CountryTime(name: 'UTC', offset: Duration(hours: 0, minutes: 0)),
    CountryTime(name: 'Hawaii', offset: Duration(hours: -10)),
    CountryTime(name: 'Alaska', offset: Duration(hours: -9)),
    CountryTime(name: 'Los Angeles', offset: Duration(hours: -8)),
    CountryTime(name: 'Chicago', offset: Duration(hours: -6)),
    CountryTime(name: 'New York', offset: Duration(hours: -5)),
    CountryTime(name: 'London', offset: Duration(hours: 0)),
    CountryTime(name: 'Paris', offset: Duration(hours: 1)),
    CountryTime(name: 'CET', offset: Duration(hours: 1)),
    CountryTime(name: 'Moscow', offset: Duration(hours: 3)),
  ];
  List<CountryTime> clocks2 = [
    CountryTime(name: 'Vladivostok', offset: Duration(hours: 10)),
    CountryTime(name: 'South Africa', offset: Duration(hours: 2)),
    CountryTime(name: 'Dubai', offset: Duration(hours: 4)),
    CountryTime(name: 'Istanbul', offset: Duration(hours: 3)),
    CountryTime(name: 'Mumbai', offset: Duration(hours: 5, minutes: 30)),
    CountryTime(name: 'Singapore', offset: Duration(hours: 8)),
    CountryTime(name: 'Seoul', offset: Duration(hours: 9)),
    CountryTime(name: 'Tokyo', offset: Duration(hours: 9)),
    CountryTime(name: 'Hong Kong', offset: Duration(hours: 8)),
    CountryTime(name: 'Sydney', offset: Duration(hours: 10)),
  ];

  Map timezones = {
    'UTC': Duration(hours: 0),
    'Hawaii': Duration(hours: -10),
    'Alaska': Duration(hours: -9),
    'Los Angeles': Duration(hours: -8),
    'Chicago': Duration(hours: -6),
    'New York': Duration(hours: -5),
    'London': Duration(hours: 0),
    'Paris': Duration(hours: 1),
    'CET': Duration(hours: 1),
    'Moscow': Duration(hours: 3),
    'Vladivostok': Duration(hours: 10),
    'South Africa': Duration(hours: 2),
    'Dubai': Duration(hours: 4),
    'Istanbul': Duration(hours: 3),
    'Mumbai': Duration(hours: 5, minutes: 30),
    'Singapore': Duration(hours: 8),
    'Seoul': Duration(hours: 9),
    'Tokyo': Duration(hours: 9),
    'Hong Kong': Duration(hours: 8),
    'Sydney': Duration(hours: 10),
  };

  String timeFormat(String s){
    int i,j = 1;
    String s1 = '';
    int k = 0;
    if(s[0] == '-')
      s1 = '-';
    else {
      s1 = '+';
      j = 0;
    }
    for( i=j;i<s.length;i++){
      if(s[i] == ':'){
        k++;
      }
      if(k<2){
        s1 = s1 +s[i];
      }
      else{
        break;
      }
    }
    return s1;
  }
  
  void getTime(String name) {
    setState(() {
      currentTimeZone = name;
      offset = timezones[name];
      print(offset);
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        UITime = DateTime.now().toUtc().add(offset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                height: 150.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      '${currentTimeZone}',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2.0,
                          fontSize: 30,
                          fontFamily: 'Merriweather'),
                    ),
//                    Container(
//                      height: 250,
//                      decoration:
//                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
//                        BoxShadow(
//                            //offset: const Offset(3.0, 3.0),
//                            blurRadius: 5.0,
//                            spreadRadius: 5.0,
//                            color: Colors.grey[700]),
//                      ]),
//                      child: new Hello(offset)
//                    ),
//                    SizedBox(
//                      height: 10.0,
//                    ),
                    Text(
                      '${UITime.toIso8601String().substring(11, 19)}',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontSize: 50,
                          fontFamily: 'Merriweather'),
                    ),
                    Text(
                      'UTC ${timeFormat(offset.toString())}',
                      style: TextStyle(
                          color: Colors.white,
                        letterSpacing: 2.0
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              'Timezones',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontFamily: 'Merriweather'),
            ),
            Divider(
              height: 20.0,
              color: Colors.white,
              thickness: 5.0,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                children: <Widget>[
                  SizedBox(
                    height: 300.0,
                    child: ListView.builder(
                      itemCount: clocks1.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            getTime(clocks1[index].name);
                          },
                          child: clockWidget(
                              clocks1[index].offset, clocks1[index].name),
                        );
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Divider(
                    height: 20.0,
                    color: Colors.white,
                    thickness: 5.0,
                  ),
                  SizedBox(
                    height: 300.0,
                    child: ListView.builder(
                      itemCount: clocks2.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              getTime(clocks2[index].name);
                            },
                            child: clockWidget(
                                clocks2[index].offset, clocks2[index].name));
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}

class Hello extends StatelessWidget {
  Duration offset;
  Hello(Duration off) {
    offset = off;
    print(offset);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterAnalogClock(
      dateTime: DateTime.now().toUtc().add(Duration(hours: 5)),
      isLive: true,
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
      showNumber: true,
    );
    ;
  }
}

class AnalogClock extends StatefulWidget {
  Duration offset;
  AnalogClock(Duration off) {
    offset = off;
  }
  @override
  _AnalogClockState createState() => _AnalogClockState(offset);
}

class _AnalogClockState extends State<AnalogClock> {
  Duration of1;
  _AnalogClockState(Duration off) {
    of1 = off;
  }
  @override
  Widget build(BuildContext context) {
    return FlutterAnalogClock(
      dateTime: DateTime.now(),
      isLive: true,
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
      showNumber: true,
    );
  }
}
