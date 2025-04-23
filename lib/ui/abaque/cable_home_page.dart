import 'package:abaque_app/ui/abaque/length_query_mono.dart';
import 'package:abaque_app/ui/abaque/section_query_mono.dart';
import 'package:flutter/material.dart';

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
            Text('Section d\'un câble :'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SectionQueryMono(),
                  ),
                );
              },
              child: Text('Section'),
            ),
          ],
        ),
      ),
    );
  }
}
