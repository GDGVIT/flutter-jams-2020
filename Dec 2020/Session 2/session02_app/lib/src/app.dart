import 'package:flutter/material.dart';
import 'package:session02_app/src/constants/myconstants.dart';
import 'package:session02_app/src/screens/home_page.dart';

class VitianApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: vitianColor,
        accentColor: vitianColor,
        buttonColor: vitianColor,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: HomePage(),
    );
  }
}
