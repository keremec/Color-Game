import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gamepage.dart';
import 'endpage.dart';
import 'main.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    // Prevent Screen Rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Column(children: [
          Expanded(
              flex: 35,
              child: Center(
                child: Text(
                  'Color Game',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              )),
          Expanded(
            flex: 65,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, bottom: 5.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GamePage(3, 9)));
                        },
                        child: Text("3x3"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, bottom: 5.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            primary: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GamePage(4, 16)));
                        },
                        child: Text("4x4"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, bottom: 5.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            primary: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GamePage(5, 25)));
                        },
                        child: Text("5x5"),
                      ),
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
