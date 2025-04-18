import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/main.dart';
import 'package:abaque_app/ui/abaque/length_query_mono.dart';
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
  final powerController = TextEditingController();

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
    void fillEverything() {
      lengthController.text =
          computeLength(
            section: section,
            voltage: voltage,
            intensity: intensity,
          ).toString();
      voltageController.text =
          computeVoltage(
            section: section,
            length: length,
            intensity: intensity,
          ).toString();
      voltageController.text =
          computeVoltage(
            section: section,
            length: length,
            intensity: intensity,
          ).toString();
    }

    void updateFormValue(controller) {
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
      appBar: AppBar(title: Text('Abaque')),
      body: Center(
        child: Column(
          children: [
            Text('Longueur du câble :'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LengthQueryMono(),
                  ),
                );
              },
              child: Text('Longueur'),
            ),
          ],
        ),
      ),
    );
  }
}
