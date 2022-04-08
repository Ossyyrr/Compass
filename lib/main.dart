import 'package:compass/helpers/repos/magnetometer.dart';
import 'package:compass/helpers/widgets/compass.dart';
import 'package:compass/helpers/widgets/degress.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final magnetometerRepo = MagnetometerRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Compass(magnetometerRepo: magnetometerRepo),
            Degrees(magnetometerRepo: magnetometerRepo),
          ],
        ),
      ),
    );
  }
}
