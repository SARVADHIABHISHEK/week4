import 'package:flutter/material.dart';
import 'package:week4/urllauncher.dart';

import 'Listview_swipetodelete_reorderable.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(Colors.red[500]),
          )
      ),
      home: const UrlLaunch(),
    );
  }
}
