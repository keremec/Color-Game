import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'main.dart';
import 'startpage.dart';
import 'endpage.dart';

//ignore: must_be_immutable
class GamePage extends StatefulWidget {
  int cac; // Cross Axis Count
  int tlc; // Tile Count

  GamePage(this.cac, this.tlc);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();

    // Choosing the first color
    c = rnd.nextInt(7);
    nowcolor = TileColors[c];
    TileColors.removeAt(c);

    TilesData.clear(); // Clears remaining data from the previous game.

    // Filling the tiles with random colors.
    for (int i = 0; i < widget.tlc; i++) {
      TilesData.add(TileColors[rnd.nextInt(6)]);
    }

    TilesData[rnd.nextInt(widget.tlc)] = nowcolor;

    // sets first values
    TimeLeft = 60;
    score = 0;

    // defines a timer
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (TimeLeft > 0) {
        setState(() {
          TimeLeft--;
        });
      } else {
        timer.cancel();
        TileColors.add(nowcolor);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => EndPage(score)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = 'GamePage';
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Column(children: [
          SizedBox(
            height: 230,
            child: Column(
              children: [
                Container(
                  height: 25,
                ),

                // *** Upper Part ***

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // Timer
                      height: 150,
                      width: 150,
                      child: Text(
                        '$TimeLeft',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 130),
                      ),
                    ),
                    Container(
                      // Space
                      height: 205,
                      width: 60,
                    ),
                    Container(
                      // *** Next Color ***
                      height: 150,
                      width: 150,
                      child: Material(
                        type: MaterialType.card,
                        color: nowcolor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // *** Lower Part ***

          SizedBox(
            width: 400,
            height: 450,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: widget.cac,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              children: List.generate(widget.tlc, (index) {
                return Center(
                  child: Material(
                      type: MaterialType.card,
                      color: TilesData[index],
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (TilesData[index] == nowcolor) {
                              score++;
                              TileColors.add(nowcolor);
                              c = rnd.nextInt(7);
                              nowcolor = TileColors[c];
                              TileColors.removeAt(c);
                              TilesData.clear();
                              for (int i = 0; i < widget.tlc; i++) {
                                TilesData.add(TileColors[rnd.nextInt(6)]);
                              }
                              TilesData[rnd.nextInt(widget.tlc)] = nowcolor;
                              TilesData.shuffle();
                            }
                          });
                        },
                      )),
                );
              }),
            ),
          ),
        ]),
      ),
    );
  }
}
