import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CableHomePage extends StatefulWidget {
  const CableHomePage({super.key});

  @override
  State<CableHomePage> createState() => _CableHomePageState();
}

class _CableHomePageState extends State<CableHomePage> {
  final voltageController = TextEditingController();
  final lengthController = TextEditingController();
  final intensityController = TextEditingController();
  final sectionController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  // }

  @override
  void dispose() {
    voltageController.dispose();
    lengthController.dispose();
    intensityController.dispose();
    sectionController.dispose();
    super.dispose();
  }

  num stringToNum({str}) {
    num res = 0;
    if (str != null) {
      try {
        res = num.parse(str);
      } on Exception catch (_) {
        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return AlertDialog(
        //       title: Text('Doit contenir des chiffres uniquement.'),
        //     );
        //   },
        // );
        return -1;
      }
      return res;
    }
    return -1;
  }

  bool isEverythingFilled(controller) {
    if ((voltageController.text.isNotEmpty ||
            voltageController == controller) &&
        (lengthController.text.isNotEmpty || lengthController == controller) &&
        (intensityController.text.isNotEmpty ||
            intensityController == controller) &&
        (sectionController.text.isNotEmpty ||
            sectionController == controller)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    void fillEverything() {
      lengthController.text =
          computeLength(
            section: appState.section,
            voltage: appState.voltage,
            intensity: appState.intensity,
          ).toString();
      voltageController.text =
          computeVoltage(
            section: appState.section,
            length: appState.length,
            intensity: appState.intensity,
          ).toString();
      voltageController.text =
          computeVoltage(
            section: appState.section,
            length: appState.length,
            intensity: appState.intensity,
          ).toString();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('App_name cable')),
      body: Column(
        children: [
          Text('Voltage : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: voltageController,
            onChanged: (value) {
              appState.voltage = stringToNum(str: value);
              if (isEverythingFilled(voltageController)) {
                lengthController.text =
                    computeLength(
                      section: appState.section,
                      voltage: appState.voltage,
                      intensity: appState.intensity,
                    ).toString();
              }
            },
          ),
          Text('Length : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: lengthController,

            onChanged: (value) {
              appState.length = stringToNum(str: value);
              if (isEverythingFilled(lengthController)) {
                voltageController.text =
                    computeVoltage(
                      section: appState.section,
                      length: appState.length,
                      intensity: appState.intensity,
                    ).toString();
              }
            },
          ),
          Text('Intensity : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: intensityController,
              
            onSubmitted: (value) {
              appState.intensity = stringToNum(str: value);
            },
          ),
          Text('Power : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: intensityController,
            decoration: InputDecoration(),
            onSubmitted: (value) {
              appState.intensity = stringToNum(str: value);
            },
          ),
          Text('Section : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: sectionController,

            onSubmitted: (value) {
              appState.section = stringToNum(str: value);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Debug'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  '\nvoltage : ${appState.voltage.toString()}'
                  '\nlength : ${appState.length.toString()}'
                  '\nsection : ${appState.section.toString()}'
                  '\nintensity : ${appState.intensity.toString()}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
