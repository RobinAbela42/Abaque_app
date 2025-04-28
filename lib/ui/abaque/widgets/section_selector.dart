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
    var theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Table(
          children: [
            TableRow(
              children: [
                Center(
                  child: Text(
                    'Section : ',
                    style: TextStyle(color: theme.colorScheme.surface),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                DropdownButton<num>(
                  style: TextStyle(color: theme.colorScheme.primary),
                  borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
                  items:
                      acceptableSections.map<DropdownMenuItem<num>>((
                        Section value,
                      ) {
                        String res = value.diameter.toString();
                        if (value.diameter == 0) {
                          res = "Section en";
                        }
                        return DropdownMenuItem<num>(
                          value: value.diameter,

                          child: Text(
                            "$res mm2",
                            style: TextStyle(color: theme.colorScheme.surface),
                          ),
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
        ),
      ),
    );
  }
}
