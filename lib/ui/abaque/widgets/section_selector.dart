import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Sectionselector extends StatefulWidget {
  const Sectionselector({super.key});

  @override
  State<Sectionselector> createState() => _SectionselectorState();
}

class SectionNotification extends Notification {}

class _SectionselectorState extends State<Sectionselector> {

  @override
  void initState() {
    super.initState();
    section = 0;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,10,20,10),
        child: Table(
          children: [
            TableRow(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,10),
                    child: Text(
                      'Section (à renseigner) : ',
                      style: TextStyle(color: theme.colorScheme.surface),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                DropdownButton2<num>(
                  isExpanded: true,
                  underline: SizedBox(width: 0, height: 0),
                  style: TextStyle(color: theme.colorScheme.surface),
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: theme.colorScheme.scrim),
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    iconEnabledColor: theme.colorScheme.surface,
                  ),

                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: theme.colorScheme.onPrimaryFixedVariant,
                    ),
                  ),
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
