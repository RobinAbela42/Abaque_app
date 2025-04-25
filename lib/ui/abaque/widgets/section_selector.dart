import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:flutter/material.dart';

class Sectionselector extends StatefulWidget {
  const Sectionselector({super.key});

  @override
  State<Sectionselector> createState() => _SectionselectorState();
}

class SectionNotification extends Notification {}

class _SectionselectorState extends State<Sectionselector> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [Text('Section : ')]),
        TableRow(
          children: [
            DropdownButton<num>(
              items:
                  acceptableSections.map<DropdownMenuItem<num>>((
                    Section value,
                  ) {
                    String res = value.diameter.toString();
                    if (value.diameter == 0) {
                      res = "Choisir une section en";
                    }
                    return DropdownMenuItem<num>(
                      value: value.diameter,
                      child: Text("$res mm2"),
                    );
                  }).toList(),
              value: section,
              onChanged: (num? value) {
                setState(() {
                  section = value!;
                  SectionNotification().dispatch(context);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
