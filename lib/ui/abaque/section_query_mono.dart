import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:flutter/material.dart';

class SectionQueryMono extends CableHomePage {
  const SectionQueryMono({super.key});

  @override
  State<SectionQueryMono> createState() => _SectionQueryMonoState();
}

class _SectionQueryMonoState extends State<SectionQueryMono> {
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

  bool isEverythingFilled(controller) {
    return (((voltageController.text.isNotEmpty && voltage != 0) ||
            voltageController == controller) &&
        ((intensityController.text.isNotEmpty && intensity != 0) ||
            intensityController == controller) &&
        ((lengthController.text.isNotEmpty && length != 0) ||
            lengthController == controller));
  }

  @override
  Widget build(BuildContext context) {
    void fillSection() {
      if (isEverythingFilled(null)) {
        section = computeSection(
          // 1rst length is the method's parameter, 2nd length is the variable in ./calcluation/compute_abaque.dart
          length: length,
          voltage: voltage,
          intensity: intensity,
        );
        sectionController.text = section.toString();
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
              fillSection();
            },
          ),

          Text('Intensity : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: intensityController,

            onChanged: (value) {
              intensity = stringToNum(str: value);
              updatePUIValue(intensityController);
              fillSection();
            },
          ),
          Text('Power : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: powerController,
            onChanged: (value) {
              power = stringToNum(str: value);
              updatePUIValue(powerController);
              fillSection();
            },
          ),
          Text('Length : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: lengthController,

            onChanged: (value) {
              length = stringToNum(str: value);
              fillSection();
            },
          ),
          Text('Section : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: sectionController,
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
