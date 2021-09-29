import 'dart:math';

import 'package:flutter/material.dart';

import 'startpage.dart';
import 'gamepage.dart';
import 'endpage.dart';

int TimeLeft = 66; //Time left variable

List<Color> TileColors = [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.green,
  Colors.yellow,
  Colors.deepPurpleAccent,
  Colors.deepOrangeAccent,
  Colors.pinkAccent
];

List<Color> TilesData = []; // Color information of Tiles

var nowcolor = Colors.black; //Chosen Color

int score = 0; //Score

int c = 0; // chosen color variable

var rnd = new Random(); //random

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: StartPage(),
  ));
}
