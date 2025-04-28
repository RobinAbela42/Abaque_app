import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:flutter/material.dart';

class Intensitypowerselector extends StatefulWidget {
  const Intensitypowerselector({super.key});

  @override
  State<Intensitypowerselector> createState() => _IntensitypowerselectorState();
}

class IntensityPowerNotification extends LayoutChangedNotification {}

final intensityController = TextEditingController();
final powerController = TextEditingController();

class _IntensitypowerselectorState extends State<Intensitypowerselector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Text('Intensitée :'),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: intensityController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  onChanged: (value) {
                    intensity = stringToNum(str: value);
                    powerController.text = power.toString();
                    IntensityPowerNotification().dispatch(context);
                  },
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Text('Puissance :'),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: powerController,
                  onChanged: (value) {
                    power = stringToNum(str: value);
                    intensityController.text = intensity.toString();
                    IntensityPowerNotification().dispatch(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );

    // Table(
    //   children: [
    //     TableRow(children: ),
    //     TableRow(
    //       children: [
    //         TextField(
    //           keyboardType: TextInputType.number,
    //           controller: intensityController,

    //           onChanged: (value) {
    //             intensity = stringToNum(str: value);
    //             powerController.text = power.toString();
    //             IntensityPowerNotification().dispatch(context);
    //           },
    //         ),
    //         TextField(
    //           keyboardType: TextInputType.number,
    //           controller: powerController,
    //           onChanged: (value) {
    //             power = stringToNum(str: value);
    //             intensityController.text = intensity.toString();
    //             IntensityPowerNotification().dispatch(context);
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
