import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:flutter/material.dart';

class IntensityQueryMono extends CableHomePage {
  const IntensityQueryMono({super.key});

  @override
  State<IntensityQueryMono> createState() => _IntensityQueryMonoState();
}

class _IntensityQueryMonoState extends State<IntensityQueryMono> {
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
    return (((lengthController.text.isNotEmpty && length != 0) ||
        lengthController == controller));
  }

  @override
  Widget build(BuildContext context) {
    void fillIntensity() {
      if (isEverythingFilled(null)) {
        intensity = computeIntensity(
          section: section,
          voltage: voltage,
          length: length,
        );
        intensityController.text = intensity.toString();
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
              fillIntensity();
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
              fillIntensity();
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
              fillIntensity();
            },
          ),

          Text('Length : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: lengthController,

            onChanged: (value) {
              length = stringToNum(str: value);
              fillIntensity();
            },

          ),
          Text('Intensity : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: intensityController,
          ),
          Text('Power : '),
          TextField(
            keyboardType: TextInputType.number,
            controller: powerController,
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
