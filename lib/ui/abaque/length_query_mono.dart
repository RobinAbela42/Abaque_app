import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:abaque_app/ui/abaque/widgets/help_button.dart';
import 'package:abaque_app/ui/abaque/widgets/intensity_power_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/section_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/voltage_selector.dart';
import 'package:flutter/material.dart';

class LengthQueryMono extends CableHomePage {
  const LengthQueryMono({super.key});

  @override
  State<LengthQueryMono> createState() => _LengthQueryMonoState();
}

class _LengthQueryMonoState extends State<LengthQueryMono> {
  final lengthController = TextEditingController();

  Section selectedSection = Section(0, 0);

  AssetImage currentEmoji = AssetImage("assets/emojis/thinking.png");

  @override
  initState() {
    super.initState();
    intensity = 0;

    currentEmoji = AssetImage('assets/emojis/thinking.png');
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    bool isEverythingFilled() {
      return (intensity != 0 && section != 0 && voltage != 0);
    }

    void emptyLength() {
      length = 0;
      lengthController.text = '';
    }

    void emptyIntensityAndPower() {
      power = 0;
      intensity = 0;
      powerController.text = '';
      intensityController.text = '';
    }

    void fillLength() {
      try {
        if (isEverythingFilled()) {
          length = computeLength(
            section: section,
            voltage: voltage,
            intensity: intensity,
          );
          lengthController.text = length.toString();
        }
      } on RangeError catch (error) {
        emptyLength();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: Text(error.message));
          },
        );
      }

      if (checkOverloadedError()) {}
    }

    void updateImage() {
      setState(() {
        if (length != 0) {
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
          'Longueur (M)',
          style: TextStyle(color: theme.colorScheme.surface),
        ),
      ),
      backgroundColor: theme.colorScheme.primaryFixedDim,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              NotificationListener<VoltageNotification>(
                child: Voltageselector(),
                onNotification: (notification) {
                  emptyIntensityAndPower();
                  emptyLength();
                  fillLength();
                  updateImage();
                  return true;
                },
              ),
              NotificationListener<SectionNotification>(
                child: Sectionselector(),
                onNotification: (notification) {
                  emptyLength();
                  fillLength();
                  updateImage();
                  return true;
                },
              ),
              NotificationListener<IntensityPowerNotification>(
                child: Intensitypowerselector(),
                onNotification: (notification) {
                  emptyLength();
                  fillLength();
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
                  Text('Longueur : '),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: theme.colorScheme.scrim,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: theme.colorScheme.scrim,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: lengthController,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              HelpButton(
                text:
                    "Cette page vous est utile pour calculer la longueur maximum pour un câble, correspondant à une certaine intensitée, une section et un voltage. \n\nRemplissez les 3 cases à renseigner avec les valeurs dont vous disposez, puis lisez le resultat ! \n\nIl est fortement déconseiller d'utiliser un câble avec une longueur plus élevée que celle conseillée, pour des raisons de sécuritée veuillez privilégier une valeur plus basse.",
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
