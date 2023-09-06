import 'dart:math';

import 'package:flutter/material.dart';

class clock2 extends StatefulWidget {
  const clock2({super.key});

  @override
  State<clock2> createState() => _clock2State();
}

class _clock2State extends State<clock2> {
  int hour=0,min=0,sec=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clock();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.black,
        body: Center(
          child: Stack(alignment: Alignment.center,
            children: [
              Stack(
                children:
                  List.generate(60, (index) => Transform.rotate(
                    angle: index*(pi*2)/60,
                    child: Divider(
                      thickness: index%5==0?5:0,
                     color: index%5==0?Colors.red:Colors.white,
                     endIndent: MediaQuery.of(context).size.width*0.80,
                      indent: MediaQuery.of(context).size.width*0.15,
            ),
                  ),),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: sec*(pi*2)/60,
                  child: Divider(
                    color: Colors.white,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.20,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: min*(pi*2)/60,
                  child: Divider(
                    color: Colors.green,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.25,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: hour*(pi*2)/12,
                  child: Divider(
                    color: Colors.red,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void clock()
  {
    Future.delayed(Duration(seconds: 1),(){
     setState(() {
       hour=DateTime.now().hour;
       min=DateTime.now().minute;
       sec=DateTime.now().second;
     });
     clock();
    });
  }
}
