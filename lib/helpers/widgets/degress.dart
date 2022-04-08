import 'package:compass/helpers/repos/magnetometer.dart';
import 'package:flutter/material.dart';

class Degrees extends StatelessWidget {
  const Degrees({Key? key, required this.magnetometerRepo}) : super(key: key);

  final MagnetometerRepository magnetometerRepo;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: magnetometerRepo.azStream,
        builder: (context, snapshot) {
          final data = snapshot.data!;
          return Text(
            data.floor().toString() + 'º',
            style: const TextStyle(color: Colors.grey, fontSize: 22),
          );
        });
  }
}
