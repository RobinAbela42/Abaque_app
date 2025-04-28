import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/widgets/intensity_power_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/length_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/voltage_selector.dart';
import 'package:flutter/material.dart';

class SectionQueryMono extends StatefulWidget {
  const SectionQueryMono({super.key});

  @override
  State<SectionQueryMono> createState() => _SectionQueryMonoState();
}

class _SectionQueryMonoState extends State<SectionQueryMono> {
  final sectionController = TextEditingController();

  bool isEverythingFilled() {
    return ((intensity != 0) && (length != 0));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    void fillSection() {
      if (isEverythingFilled()) {
        section = computeSection(
          // 1rst length is the method's parameter, 2nd length is the variable in ./calcluation/compute_abaque.dart
          length: length,
          voltage: voltage,
          intensity: intensity,
        );
        sectionController.text = section.toString();
      } else {
        section = 0;
        sectionController.text = '';
      }
    }

    void emptyIntensityAndPower() {
      powerController.text = '';
      power = 0;
      intensityController.text = '';
      intensity = 0;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Section (mm2)')),
      body: Column(
        children: [
          NotificationListener<VoltageNotification>(
            child: Voltageselector(),
            onNotification: (notification) {
              emptyIntensityAndPower();
              fillSection();
              return true;
            },
          ),
          NotificationListener<IntensityPowerNotification>(
            child: Intensitypowerselector(),
            onNotification: (notification) {
              fillSection();
              return true;
            },
          ),
          NotificationListener<LengthNotification>(
            child: Lengthselector(),
            onNotification: (notification) {
              fillSection();
              return true;
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
