import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dice1 = 1;
  var dice2 = 1;
  var random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: Text(
          'Dice Roll',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 2),
        ),
      ),
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          dice1 = random.nextInt(6) + 1;
                        });
                      },
                      child: Image(image: AssetImage('images/dice$dice1.png'))),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          dice2 = random.nextInt(6) + 1;
                        });
                      },
                      child: Image(image: AssetImage('images/dice$dice2.png'))),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black87,
        onPressed: () {},
        label: Row(
          children: <Widget>[
            Icon(Icons.whatshot),
            SizedBox(
              width: 10.0,
            ),
            Text('$dice1 + $dice2 is ${dice1 + dice2}')
          ],
        ),
      ),
    );
  }
}
