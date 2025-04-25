import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:abaque_app/ui/abaque/widgets/intensity_power_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/section_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/voltage_selector.dart';
import 'package:flutter/material.dart';

class LengthQueryMono extends CableHomePage {
  const LengthQueryMono({super.key});

  @override
  State<LengthQueryMono> createState() => _LengthQueryMonoState();
}

class _LengthQueryMonoState extends State<LengthQueryMono> {
  final lengthController = TextEditingController();

  Section selectedSection = Section(0, 0);

  bool isEverythingFilled() {
    return (intensity != 0  && 
        section != 0);
  }

  @override
  Widget build(BuildContext context) {
    void fillLength() {
      if (checkOverloadedError()) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'La section $section mm2 ne peut pas accepter plus de $intensity Ampères.',
              ),
            );
          },
        );
      }
      if (isEverythingFilled()) {
        length = computeLength(
          section: section,
          voltage: voltage,
          intensity: intensity,
        );
        lengthController.text = length.toString();
      }
      else {
        length = 0;
        lengthController.text ='';
      }
    }

    void emptyIntensityAndPower() {
      debugPrint('EmptyIandP');
      powerController.text = '';
      power=0;
      intensityController.text = '';
      intensity=0;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('App_name cable')),
      body: Column(
        children: [
          NotificationListener<VoltageNotification>(
            child: Voltageselector(),
            onNotification: (notification) {
              emptyIntensityAndPower();
              fillLength();
              return true;
            },
          ),
          NotificationListener<SectionNotification>(
            child: Sectionselector(),
            onNotification: (notification) {
              fillLength();
              return true;
            },
          ),
          NotificationListener<IntensityPowerNotification>(
            child: Intensitypowerselector(),
            onNotification: (notification) {
              fillLength();
              return true;
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
