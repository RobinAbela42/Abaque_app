import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class CableHomePage extends StatefulWidget {
  CableHomePage({super.key});

  // Length of the section wanted, in meters
  double length = 0;
  // Diameter of the section wanted, in Squares Milimeters
  double section = 0;
  // Electrical outlet's Voltage, in Volt
  double voltage = 230;
  // Intensity of the installation, in Amps
  double intensity = 0;
  // Used material's resistance, copper by default since it's the most used, in Ohms
  double resistance = 0.021;

  @override
  State<CableHomePage> createState() => _CableHomePageState();
}

class _CableHomePageState extends State<CableHomePage> {
  final voltageController = TextEditingController(text: '230');

  @override
  void dispose() {
    voltageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App_name cable')),
      body: Column(
        children: [
          Text('Voltage : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: voltageController,
            onSubmitted: (value) => widget.voltage = value as double,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(content: Text(widget.voltage as String));
            },
          );
        },
      ),
    );
  }
}
