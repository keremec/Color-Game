import 'package:flutter/material.dart';
import 'startpage.dart';
import 'gamepage.dart';

//ignore: must_be_immutable
class EndPage extends StatefulWidget {
  int score;

  EndPage(this.score);

  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              widget.score.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 170),
            ),
            Container(
              width: 10,
              height: 25,
            ),
            Container(
              width: 200,
              height: 100,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    primary: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => StartPage()));
                },
                child: Text("Play Again"),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
