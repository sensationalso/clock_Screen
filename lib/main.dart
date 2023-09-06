import 'package:clock_ui/screen/clock_1.dart';
import 'package:clock_ui/screen/clock_2.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    debugShowCheckedModeBanner: false,
    home: clock(),
  ));
}