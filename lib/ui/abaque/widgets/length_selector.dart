import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:flutter/material.dart';

class Lengthselector extends StatefulWidget {
  const Lengthselector({super.key});

  @override
  State<Lengthselector> createState() => _LengthselectorState();
}

class LengthNotification extends Notification {}

class _LengthselectorState extends State<Lengthselector> {

  final lengthController = TextEditingController(text:length.toString());

  @override
  void dispose() {
    lengthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [Text('Length : ')]),
        TableRow(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: lengthController,

              onChanged: (value) {
                length = stringToNum(str: value);
                LengthNotification().dispatch(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
