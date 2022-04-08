import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  List<double>? _magnetometerValues;
  double az = 0.0;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();

    _streamSubscriptions.add(
      magnetometerEvents.listen(
        (MagnetometerEvent event) {
          setState(() {
            _magnetometerValues = <double>[event.x, event.y, event.z];
            az = 90 - atan2(event.y, event.x) * 180 / pi;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final magnetometer = _magnetometerValues?.map((double v) => v.toStringAsFixed(1)).toList();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Magnetometer: $magnetometer'),
          Text('AZ: ' + az.toString()),
          Transform.rotate(
            angle: (az) / 57.295779513,
            child: const Image(
              image: AssetImage('assets/compass.png'),
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          Transform.rotate(
            angle: (az) / 57.295779513,
            child: const Icon(Icons.compass_calibration),
          ),
          Transform.rotate(
            angle: (az) / 57.295779513,
            child: const Icon(Icons.arrow_circle_up),
          ),
          Transform.rotate(
            angle: (az) / 57.295779513,
            child: const Icon(Icons.arrow_upward_outlined),
          ),
          Text(
            az.floor().toString() + 'º',
            style: const TextStyle(color: Colors.grey, fontSize: 22),
          ),

          //   Text('Sun horizntal position - Azimuth: ${calc.sunHorizontalPosition.azimuth}'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }
}
