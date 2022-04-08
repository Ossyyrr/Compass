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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
            Compass(
              magnetometerRepo: magnetometerRepo,
              child: const Image(
                image: AssetImage('assets/compass.png'),
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
            Degrees(
              magnetometerRepo: magnetometerRepo,
              textStyle: const TextStyle(fontSize: 22),
              // showDegreesSimbol: false,
            ),
            Compass(
              magnetometerRepo: magnetometerRepo,
              child: const Icon(
                Icons.arrow_circle_up,
                size: 50,
              ),
            ),
            Compass(
                magnetometerRepo: magnetometerRepo,
                child: Container(
                  width: 10,
                  height: 220,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
  }
}
