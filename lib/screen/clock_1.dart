import 'dart:ui';

import 'package:flutter/material.dart';

class clock extends StatefulWidget {
  const clock({super.key});

  @override
  State<clock> createState() => _clockState();
}

class _clockState extends State<clock> {
  int hour = 0, min = 0, sec = 0,day=0,year=0,month=0,week=0;
  String? dayname;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clock();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.80,
                width: MediaQuery.of(context).size.width * 0.80,
                child: CircularProgressIndicator(
                  color: Colors.red,
                  strokeWidth: 10,
                  value: hour / 12,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.75,
                width: MediaQuery.of(context).size.width * 0.75,
                child: CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 10,
                  value: min / 60,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.70,
                width: MediaQuery.of(context).size.width * 0.70,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 10,
                  value: sec / 60,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$dayname',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  Text(
                    '$day,$month,$year',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Text(
                    '$hour:$min:$sec',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white),
                  ),
                  Text(
                    'PM      33',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void clock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        hour = DateTime.now().hour;
        min = DateTime.now().minute;
        sec = DateTime.now().second;
        week=DateTime.now().weekday;
        day = DateTime.now().day;
        month = DateTime.now().month;
        year = DateTime.now().year;

        switch (dayname) {
          case 0:
            print('Sunday');
            break;

          case 1:
            print('Monday');
            break;

          case 2:
            print('Tuesday');
            break;

          case 3:
            print('Wednesday');
            break;
          case 4:
            print('Thursday');
            break;

          case 5:
            print('Friday');
            break;
          case 6:
            print('Saturday');
            break;
        }
        if (hour > 12) {
          hour = hour - 12;
        }
      });
      clock();
    });
  }
}
