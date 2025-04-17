import 'package:abaque_app/main.dart';
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

  @override
  void dispose() {
    voltageController.dispose();
    super.dispose();
  }

  num stringToNum({str}) {
    num res = 0;
    try {
      res = num.parse(str);
    } on Exception catch (_) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Doit contenir des chiffres uniquement.'),
          );
        },
      );
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(title: const Text('App_name cable')),
      body: Column(
        children: [
          Text('Voltage : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: voltageController,

            onSubmitted: (value) {
              appState.voltage = stringToNum(str: value);
            },
          ),
          Text('Length : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: lengthController,

            onSubmitted: (value) {
              appState.length = stringToNum(str: value);
            },
          ),
          Text('Intensity : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: intensityController,

            onSubmitted: (value) {
              appState.intensity = stringToNum(str: value);
            },
          ),
          Text('Section : '),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 4,
            controller: sectionController,

            onSubmitted: (value) {
              appState.section = stringToNum(str: value);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Debug'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  '\nvoltage : ${appState.voltage.toString()}'
                  '\nlength : ${appState.length.toString()}'
                  '\nsection : ${appState.section.toString()}'
                  '\nintensity : ${appState.intensity.toString()}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
