import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer t;
  int s = 0;
  bool r = false;

  void start() {
    t = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        s++;
      });
    });
    r = true;
  }

  void stop() {
    t.cancel();
    r = false;
  }

  void reset() {
    stop();
    setState(() {
      s = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            s.toString(),
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: r ? null : start,
                child: Text('Start'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: r ? stop : null,
                child: Text('Stop'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: reset,
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}