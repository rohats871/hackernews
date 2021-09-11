import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hackerapp/Screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: HomePage(),
        splash: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hacker",
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
              Text(
                "News",
                style: TextStyle(color: Colors.lime, fontSize: 50),
              ),
            ],
          ),
          // child: Icon(
          //   Icons.http,
          //   size: 100,
          // ),
        ),
      ),
    );
  }
}
// return AnimatedSplashScreen(
// splash: 'images/splash.png',
// nextScreen: MainScreen(),
// splashTransition: SplashTransition.rotationTransition,
// pageTransitionType: PageTransitionType.scale,
// );
