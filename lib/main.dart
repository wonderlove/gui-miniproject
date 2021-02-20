import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

        // children: quotes.map((quote) => QuoteCard(quote: quote)).toList(),
      ),
    );
  }
}

class flutterab extends StatefulWidget {
  @override
  _flutterabState createState() => _flutterabState();
}

class _flutterabState extends State<flutterab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
