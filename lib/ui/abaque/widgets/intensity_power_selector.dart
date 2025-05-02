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
    var theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,0,10,0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Intensité :\n(à renseigner)',
                        style: TextStyle(color: theme.colorScheme.surface),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: intensityController,
                      style: TextStyle(color: theme.colorScheme.surface),
                      cursorColor: theme.colorScheme.scrim,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.colorScheme.scrim),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.colorScheme.scrim),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: "Ampères (A)",
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(111, 255, 255, 255),
                          fontSize: 10,
                        ),
                      ),
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
                padding: const EdgeInsets.fromLTRB(10,0,20,0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Puissance :\n(à renseigner)',
                        style: TextStyle(color: theme.colorScheme.surface),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: powerController,
                      cursorColor: theme.colorScheme.scrim,
                      style: TextStyle(color: theme.colorScheme.surface),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.colorScheme.scrim),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.colorScheme.scrim),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: "Watt (W)",
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(111, 255, 255, 255),
                
                          fontSize: 10,
                        ),
                        
                      ),
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
        ),
      ),
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
