import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:flutter/material.dart';

class Lengthselector extends StatefulWidget {
  const Lengthselector({super.key});

  @override
  State<Lengthselector> createState() => _LengthselectorState();
}

class LengthNotification extends Notification {}

class _LengthselectorState extends State<Lengthselector> {
  final lengthController = TextEditingController(text: "");

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
        padding: const EdgeInsets.fromLTRB(20,15,20,15),
        child: Table(
          children: [
            TableRow(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      'Longueur (à renseigner) : ',
                      style: TextStyle(color: theme.colorScheme.surface),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: theme.colorScheme.surface,
                    decorationColor: theme.colorScheme.scrim,
                  ),
                  controller: lengthController,
                  cursorColor: theme.colorScheme.scrim,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.scrim),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.scrim),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    labelText: "Mètres (m)",
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(111, 255, 255, 255),
                    ),
                  ),
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
