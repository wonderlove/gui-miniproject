import 'package:flutter/material.dart';


class Disturbance {
  String level;
  String time;
  Disturbance({this.level, this.time}){
    this.level = level;
    this.time = time;
  }
}

class ListCard extends StatelessWidget {
  final Disturbance disturbance;
  ListCard({this.disturbance});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      color: Colors.white,
      child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                'DISTURBANCE:',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 140.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  disturbance.time,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.0),
          Row(
            children: [
              Text(
                "LEVEL: ",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5.0),
              Text(
                  disturbance.level,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
            ],
          )
        ],
      ),
      ),
    );
  }
}