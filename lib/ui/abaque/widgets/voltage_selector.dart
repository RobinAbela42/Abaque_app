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
    var theme = Theme.of(context);
    return Card(
        shadowColor: theme.colorScheme.shadow,
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                child: Text(
                  'Voltage :',
                  style: TextStyle(color: theme.colorScheme.surface),
                ),
              ),
              RadioListTile<num>(
                title: Text(
                  '230',
                  style: TextStyle(color: theme.colorScheme.surface),
                ),
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
                title: Text(
                  '400',
                  style: TextStyle(color: theme.colorScheme.surface),
                ),
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
          ),
        ),
    );
  }
}
