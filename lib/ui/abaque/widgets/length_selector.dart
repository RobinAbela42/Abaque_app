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
        var theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Table(
          children: [
            TableRow(children: [Center(child: Text('Longueur : '))]),
            TableRow(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: lengthController,
                  decoration: InputDecoration(border: OutlineInputBorder(), fillColor: theme.colorScheme.surface),
                  onChanged: (value) {
                    length = stringToNum(str: value);
                    LengthNotification().dispatch(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
