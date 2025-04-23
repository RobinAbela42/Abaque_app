import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:flutter/material.dart';

class LengthQueryMono extends CableHomePage {
  const LengthQueryMono({super.key});

  @override
  State<LengthQueryMono> createState() => _LengthQueryMonoState();
}

class _LengthQueryMonoState extends State<LengthQueryMono> {
  final voltageController = TextEditingController(text: "230");
  final lengthController = TextEditingController();
  final intensityController = TextEditingController();
  final powerController = TextEditingController();

  @override
  void dispose() {
    voltageController.dispose();
    lengthController.dispose();
    intensityController.dispose();
    powerController.dispose();
    super.dispose();
  }

  bool isEverythingFilled(controller) {
    return (((voltageController.text.isNotEmpty && voltage != 0) ||
            voltageController == controller) &&
        ((intensityController.text.isNotEmpty && intensity != 0) ||
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
          DropdownButton<num>(
            items:
                acceptableSections.map<DropdownMenuItem<num>>((num value) {
                  String res = value.toString();
                  if (value == 0) {
                    res = "Choisir une section en";
                  }
                  return DropdownMenuItem<num>(value: value, child: Text("$res mm2"));
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
