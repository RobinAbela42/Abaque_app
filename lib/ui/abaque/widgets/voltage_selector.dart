import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:flutter/material.dart';

class Voltageselector extends StatefulWidget {
  const Voltageselector({super.key});

  @override
  State<Voltageselector> createState() => _VoltageselectorState();
}

class VoltageNotification extends Notification {}

class _VoltageselectorState extends State<Voltageselector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Voltage : '),
        RadioListTile<num>(
          title: const Text('230'),
          value: singlePhasedVoltage,
          groupValue: voltage,
          onChanged: (num? value) {
            setState(() {
              voltage = value!;
              VoltageNotification().dispatch(context);
            });
          },
        ),

        RadioListTile<num>(
          title: const Text('400'),
          value: treePhasedVoltage,
          groupValue: voltage,
          onChanged: (num? value) {
            setState(() {
              voltage = value!;
              VoltageNotification().dispatch(context);
            });
          },
        ),
      ],
    );
  }
}
