import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:uiapp/constant.dart';
import 'package:uiapp/index.dart';

import 'index.dart';

void main() => runApp(
  MaterialApp(
    title: 'Calculator App',
    debugShowCheckedModeBanner: false,
    home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new InputPage(),

        title: new Text(
          'PestScout,\n Improve your Agro',
          textAlign: TextAlign.center,
          style: kLargeButtonTextStyle,


        ),
        image: new Image.asset('images/go-green.jpg'),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 180.0,
        loaderColor: Colors.red),
  ),
);
