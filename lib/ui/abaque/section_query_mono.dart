import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:abaque_app/ui/abaque/widgets/help_button.dart';
import 'package:abaque_app/ui/abaque/widgets/intensity_power_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/length_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/voltage_selector.dart';
import 'package:flutter/material.dart';

class SectionQueryMono extends StatefulWidget {
  const SectionQueryMono({super.key});

  @override
  State<SectionQueryMono> createState() => _SectionQueryMonoState();
}

class _SectionQueryMonoState extends State<SectionQueryMono> {
  final sectionController = TextEditingController();

  AssetImage currentEmoji = AssetImage("assets/emojis/thinking.png");

  @override
  initState() {
    super.initState();
    currentEmoji = AssetImage('assets/emojis/thinking.png');
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    bool isEverythingFilled() {
      return (intensity != 0 && length != 0 && voltage != 0);
    }

    void fillSection() {
      if (isEverythingFilled()) {
        section = computeSection(
          // 1rst length is the method's parameter, 2nd length is the variable in ./calcluation/compute_abaque.dart
          length: length,
          voltage: voltage,
          intensity: intensity,
        );
        sectionController.text = section.toString();
      }
    }

    void emptyIntensityAndPower() {
      power = 0;
      intensity = 0;
      powerController.text = '';
      intensityController.text = '';
    }

    void emptySection() {
      section = 0;
      sectionController.text = '';
    }

    void updateImage() {
      setState(() {
        if (section != 0) {
          currentEmoji = AssetImage("assets/emojis/smiling.png");
        } else {
          currentEmoji = AssetImage("assets/emojis/thinking.png");
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          'Section (mm2)',
          style: TextStyle(color: theme.colorScheme.surface),
        ),
      ),
      backgroundColor: theme.colorScheme.primaryFixedDim,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              NotificationListener<VoltageNotification>(
                child: Voltageselector(),
                onNotification: (notification) {
                  emptyIntensityAndPower();
                  emptySection();
                  fillSection();
                  updateImage();
                  return true;
                },
              ),
              NotificationListener<IntensityPowerNotification>(
                child: Intensitypowerselector(),
                onNotification: (notification) {
                  emptySection();
                  fillSection();
                  updateImage();
                  return true;
                },
              ),
              NotificationListener<LengthNotification>(
                child: Lengthselector(),
                onNotification: (notification) {
                  emptySection();
                  fillSection();
                  updateImage();
                  return true;
                },
              ),
              ResultCard(
                children: [
                  Wrap(
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        'Résultat : ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image(image: currentEmoji),
                      ),
                    ],
                  ),
                  Text('Section : '),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      readOnly: true,
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
                      ),
                      controller: sectionController,
                    ),
                  ),
                ],
              ),
              HelpButton(
                text:
                    "Cette page vous est utile pour calculer la section idéale pour un câble, correspondant à une certaine intensitée, une longueur et un voltage. \n\nRemplissez les 3 cases à renseigner avec les valeurs dont vous disposez, puis lisez le resultat ! \n\nIl est fortement déconseiller d'utiliser un câble avec une section plus élevée que celle conseillée, pour des raisons de sécuritée veuillez privilégier une valeur plus basse.",
              ),
            ],
          ),
        ),
      ),
      //Debug
      // floatingActionButton: FloatingActionButton(
      //   child: Text('Debug'),
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           content: Text(
      //             '\nlength : ${length.toString()}'
      //             '\nresistance : ${resistance.toString()}'
      //             '\nsection : ${section.toString()}'
      //             '\nvoltage : ${voltage.toString()}'
      //             '\npower : ${power.toString()}'
      //             '\nintensity : ${intensity.toString()}',
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
