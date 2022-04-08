import 'package:compass/helpers/repos/magnetometer.dart';
import 'package:flutter/material.dart';

class Compass extends StatelessWidget {
  const Compass({Key? key, required this.magnetometerRepo}) : super(key: key);

  final MagnetometerRepository magnetometerRepo;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: magnetometerRepo.azStream,
        builder: (context, snapshot) {
          final data = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Transform.rotate(
                  angle: data / 57.295779513,
                  child: const Image(
                    image: AssetImage('assets/compass.png'),
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
                // Transform.rotate(
                //   angle: (az) / 57.295779513,
                //   child: const Icon(Icons.compass_calibration),
                // ),
                // Transform.rotate(
                //   angle: (az) / 57.295779513,
                //   child: const Icon(Icons.arrow_circle_up),
                // ),
                // Transform.rotate(
                //   angle: (az) / 57.295779513,
                //   child: const Icon(Icons.arrow_upward_outlined),
                // ),
              ],
            ),
          );
        });
  }
}
