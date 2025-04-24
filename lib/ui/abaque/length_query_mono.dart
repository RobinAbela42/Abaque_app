import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:flutter/material.dart';

class LengthQueryMono extends CableHomePage {
  const LengthQueryMono({super.key});

  @override
  State<LengthQueryMono> createState() => _LengthQueryMonoState();
}

class _LengthQueryMonoState extends State<LengthQueryMono> {
  final lengthController = TextEditingController();
  final intensityController = TextEditingController();
  final powerController = TextEditingController();

  Section selectedSection = Section(0, 0);

  @override
  void dispose() {
    lengthController.dispose();
    intensityController.dispose();
    powerController.dispose();
    super.dispose();
  }

  bool isEverythingFilled(controller) {
    return (((intensityController.text.isNotEmpty && intensity != 0) ||
            intensityController == controller) &&
        section != 0);
  }

  @override
  Widget build(BuildContext context) {
    void fillLength() {
      if (isEverythingFilled(null)) {
        length = computeLength(
          section: section,
          voltage: voltage,
          intensity: intensity,
        );
        lengthController.text = length.toString();
      }
    }

    void updatePUIValue(controller) {
      if (controller == powerController || controller == null) {
        intensityController.text = intensity.toString();
      }
      else if (controller == intensityController || controller == null) {
        powerController.text = power.toString();
      }
    }

    void emptyIntensityAndPower() {
      powerController.text = "";
      intensityController.text = "";
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
              fillLength();
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
              fillLength();
            },
          ),
          Text('Section : '),
          DropdownButton<num>(
            items:
                acceptableSections.map<DropdownMenuItem<num>>((Section value) {
                  String res = value.sec.toString();
                  if (value.sec == 0) {
                    res = "Choisir une section en";
                  }
                  return DropdownMenuItem<num>(
                    value: value.sec,
                    child: Text("$res mm2"),
                  );
                }).toList(),
            value: section,
            onChanged: (num? value) {
              setState(() {
                section = value!;
              });
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
