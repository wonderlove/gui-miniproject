import 'dart:async';
import 'card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble/flutter_ble.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FlutterBle flutterBlue = FlutterBle.instance;
  
  //remove this part with the data received from esp
  List<Disturbance> placeholder = [
    Disturbance(level: 'low', time: "5:30 am"),
    Disturbance(level: 'medium', time: "5:34 am"),
    Disturbance(level: 'medium', time: "5:34 am"),
    Disturbance(level: 'medium', time: "5:34 am"),
    Disturbance(level: 'medium', time: "5:34 am"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset('assets/logo.png', fit: BoxFit.cover),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 3, 8, 3),
                child: Text(
                  "LOG",
                    style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                )),
              ),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 1.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 292.0,
            width: 502.0,
            child: ListView(
              //edit this when ble is connected and the data is received
              children: placeholder.map((disturbance) => ListCard(disturbance: disturbance)).toList(),
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.0, color: Colors.white),
                left: BorderSide(width: 1.0, color: Colors.white),
                right: BorderSide(width: 1.0, color: Colors.white),
                bottom: BorderSide(width: 2.0, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 3, 8, 3),
                child: Text(
                    "GRAPH",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )),
              ),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 1.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              width: 502,
              height: 150,
              child: Text(
                  'Graph stuff here, Filler',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ))
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                  ),
                  child: Text(
                    'CONNECT',
                    style: TextStyle(
                        fontSize: 16
                    ),),
                  onPressed: () {
                    print('FILLER');
                  }
              ),
              SizedBox(width: 15),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                  ),
                  child: Text(
                    'DISCONNECT',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  onPressed: () {
                    print('FILLER');
                  }
              )
            ],
          ),
        ],
      ),
    );
  }
}
