import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:flutter/material.dart';

class Voltageselector extends StatefulWidget {
  const Voltageselector({super.key});

  @override
  State<Voltageselector> createState() => _VoltageselectorState();
}

class VoltageNotification extends Notification {}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final num groupValue;
  final num value;
  final ValueChanged<num> onChanged;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<num>(
              groupValue: groupValue,
              value: value,
              activeColor: theme.colorScheme.primaryFixedDim,
              onChanged: (num? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label, style: TextStyle(color: theme.colorScheme.surface),),
          ],
        ),
      ),
    );
  }
}

class _VoltageselectorState extends State<Voltageselector> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      shadowColor: theme.colorScheme.shadow,
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
              child: Text(
                'Voltage (à renseigner) :',
                style: TextStyle(color: theme.colorScheme.surface),
              ),
            ),
            LabeledRadio(
              label: "230",
              padding: EdgeInsets.symmetric(horizontal: 10),
              groupValue: voltage,
              value: singlePhasedVoltage,
              onChanged: (num? value) {
                setState(() {
                  voltage = value!;
                  VoltageNotification().dispatch(context);
                });
              },
            ),
            LabeledRadio(
              label: "400",
              padding: EdgeInsets.symmetric(horizontal: 10),
              groupValue: voltage,

              value: threePhasedVoltage,
              onChanged: (num? value) {
                setState(() {
                  voltage = value!;
                  VoltageNotification().dispatch(context);
                });
              },
            ),
            // InkWell(
            //   onTap: () {},
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            //     child: Row(
            //       children: [
            //         Radio(
            //           value: threePhasedVoltage,
            //           groupValue: voltage,
            //           onChanged: (num? value) {
            //             setState(() {
            //               voltage = value!;
            //               VoltageNotification().dispatch(context);
            //             });
            //           },
            //         ),
            //         Text('400'),
            //       ],
            //     ),
            //   ),
            // ),
            //             RadioListTile<num>(
            //   title: Text(
            //     '230',
            //     style: TextStyle(color: theme.colorScheme.surface),
            //   ),
            //   value: singlePhasedVoltage,
            //   groupValue: voltage,
            //   activeColor: theme.colorScheme.primaryFixedDim,
            //   tileColor: theme.colorScheme.primary,
            //   onChanged: (num? value) {
            //     setState(() {
            //       voltage = value!;
            //       VoltageNotification().dispatch(context);
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
