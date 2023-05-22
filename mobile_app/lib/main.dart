import 'package:flutter/material.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proximity Sensor Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Proximity Sensor Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isNear = false;

  @override
  void initState() {
    super.initState();
    ProximitySensor.events.listen((event) {
      setState(() {
        event > 5 ? _isNear = false : _isNear = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isNear ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
