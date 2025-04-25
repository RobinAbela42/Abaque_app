import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:abaque_app/ui/abaque/widgets/length_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/section_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/voltage_selector.dart';
import 'package:flutter/material.dart';

class IntensityQueryMono extends CableHomePage {
  const IntensityQueryMono({super.key});

  @override
  State<IntensityQueryMono> createState() => _IntensityQueryMonoState();
}

class _IntensityQueryMonoState extends State<IntensityQueryMono> {
  final intensityController = TextEditingController();
  final powerController = TextEditingController();

  @override
  void dispose() {
    intensityController.dispose();
    powerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEverythingFilled() {
      return ((length != 0 && section != 0 && voltage != 0));
    }

    void fillIntensityAndPower() {
      debugPrint('Compute intensity before $intensity');
      if (isEverythingFilled()) {
        intensity = computeIntensity(
          section: section,
          voltage: voltage,
          length: length,
        );
        debugPrint('Compute intensity after $intensity');
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
          NotificationListener<VoltageNotification>(
            child: Voltageselector(),
            onNotification: (notification) {
              emptyIntensityAndPower();
              fillIntensityAndPower();
              return true;
            },
          ),
          NotificationListener<SectionNotification>(
            child: Sectionselector(),
            onNotification: (notification) {
              fillIntensityAndPower();
              return true;
            },
          ),
          NotificationListener(
            child: Lengthselector(),
            onNotification: (notification) {
              fillIntensityAndPower();
              return true;
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
