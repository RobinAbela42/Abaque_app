import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/main.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LengthQueryMono extends CableHomePage {
  const LengthQueryMono({super.key});

  @override
  State<LengthQueryMono> createState() => _LengthQueryMonoState();
}

class _LengthQueryMonoState extends State<LengthQueryMono> {
  final voltageController = TextEditingController();
  final lengthController = TextEditingController();
  final intensityController = TextEditingController();
  final sectionController = TextEditingController();
  final powerController = TextEditingController();

  @override
  void dispose() {
    voltageController.dispose();
    lengthController.dispose();
    intensityController.dispose();
    sectionController.dispose();
    powerController.dispose();
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
        return 0;
      }
      return res;
    }
    return 0;
  }

  bool isEverythingFilled(controller) {
    return ((voltageController.text.isNotEmpty ||
            voltageController == controller) &&
        (intensityController.text.isNotEmpty ||
            intensityController == controller) &&
        (sectionController.text.isNotEmpty || sectionController == controller));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    void fillLength() {
      if (isEverythingFilled(null)) {
        length =
            computeLength(
              section: section,
              voltage: voltage,
              intensity: intensity,
            );
        lengthController.text = length.toString();
      }
    }

    void updatePUIValue(controller) {
      if (controller == powerController) {
        intensityController.text = intensity.toString();
        voltageController.text = voltage.toString();
      }
      if (controller == intensityController) {
        powerController.text = power.toString();
        voltageController.text = voltage.toString();
      }
      if (controller == voltageController) {
        powerController.text = power.toString();
        intensityController.text = intensity.toString();
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('App_name cable')),
      body: Column(
        children: [
          Text('Voltage : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: voltageController,
            onChanged: (value) {
              voltage = stringToNum(str: value);
              updatePUIValue(voltageController);
              fillLength();
            },
          ),
          Text('Section : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: sectionController,

            onChanged: (value) {
              section = stringToNum(str: value);

              fillLength();
            },
          ),

          Text('Intensity : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: intensityController,

            onChanged: (value) {
              intensity = stringToNum(str: value);
              updatePUIValue(intensityController);
              fillLength();
            },
          ),
          Text('Power : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: powerController,
            onChanged: (value) {
              power = stringToNum(str: value);
              updatePUIValue(powerController);
              fillLength();
            },
          ),

          Text('Length : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: lengthController,
          ),
        ],
      ),
      //Debug
      floatingActionButton: FloatingActionButton(
        child: Text('Debug'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  '\nlength : ${length.toString()}'
                  '\nresistance : ${resistance.toString()}'
                  '\nsection : ${section.toString()}'
                  '\nvoltage : ${voltage.toString()}'
                  '\npower : ${power.toString()}'
                  '\nintensity : ${intensity.toString()}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
