import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:flutter/material.dart';

class SectionQueryMono extends StatefulWidget {
  const SectionQueryMono({super.key});

  @override
  State<SectionQueryMono> createState() => _SectionQueryMonoState();
}

class _SectionQueryMonoState extends State<SectionQueryMono> {
  final lengthController = TextEditingController();
  final intensityController = TextEditingController();
  final sectionController = TextEditingController();
  final powerController = TextEditingController();

  @override
  void dispose() {
    lengthController.dispose();
    intensityController.dispose();
    sectionController.dispose();
    powerController.dispose();
    super.dispose();
  }

  bool isEverythingFilled(controller) {

    return (((intensityController.text.isNotEmpty && intensity != 0) ||
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

    void emptyIntensityAndPower() {
      powerController.text = "";
      intensityController.text = "";
      sectionController.text="";
    }

    void updatePUIValue(controller) {
      if (controller == powerController || controller == null) {
        intensityController.text = intensity.toString();
      } else if (controller == intensityController || controller == null) {
        powerController.text = power.toString();
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('App_name cable')),
      body: Column(
        children: [
          Text('Voltage : '),
          RadioListTile<num>(
            title: const Text('230'),
            value: singlePhasedVoltage,
            groupValue: voltage,
            onChanged: (num? value) {
              setState(() {
                voltage = value!;
              });
              emptyIntensityAndPower();
              fillSection();
            },
          ),
          RadioListTile<num>(
            title: const Text('400'),
            value: treePhasedVoltage,
            groupValue: voltage,
            onChanged: (num? value) {
              setState(() {
                voltage = value!;
              });
              emptyIntensityAndPower();
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
            readOnly: true,
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
