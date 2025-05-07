import 'package:abaque_app/calculation/compute_abaque.dart';
import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:abaque_app/ui/abaque/widgets/help_button.dart';
import 'package:abaque_app/ui/abaque/widgets/length_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/section_selector.dart';
import 'package:abaque_app/ui/abaque/widgets/voltage_selector.dart';
import 'package:flutter/material.dart';

class IntensityQueryMono extends CableHomePage {
  const IntensityQueryMono({super.key});

  @override
  State<IntensityQueryMono> createState() => _IntensityQueryMonoState();
}

class _IntensityQueryMonoState extends State<IntensityQueryMono> {
  final intensityController = TextEditingController();
  final powerController = TextEditingController();

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
      return ((length != 0 && section != 0 && voltage != 0));
    }

    void fillIntensityAndPower() {
      if (isEverythingFilled()) {
        intensity = computeIntensity(
          section: section,
          voltage: voltage,
          length: length,
        );
      }
      intensityController.text = intensity.toString();
      powerController.text = power.toString();
    }

    void emptyIntensityAndPower() {
      power = 0;
      intensity = 0;
      powerController.text = "";
      intensityController.text = "";
    }

    void updateImage() {
      setState(() {
        if (intensity != 0) {
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
          'Intensitée (A)',
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
                  fillIntensityAndPower();
                  updateImage();
                  return true;
                },
              ),
              NotificationListener<SectionNotification>(
                child: Sectionselector(),
                onNotification: (notification) {
                  emptyIntensityAndPower();
                  fillIntensityAndPower();
                  updateImage();
                  return true;
                },
              ),
              NotificationListener<LengthNotification>(
                child: Lengthselector(),
                onNotification: (notification) {
                  emptyIntensityAndPower();
                  fillIntensityAndPower();
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
                  Text('Intensitée : '),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: intensityController,
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
                      readOnly: true,
                    ),
                  ),
                  Text('Puissance : '),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: powerController,
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
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              HelpButton(
                text:
                    "Cette page vous est utile pour calculer l'intensitée maximum possible pour une installation, à partir d'une section de câble, d'une longueur et d'un voltage. \n\nRemplissez les 3 cases à renseigner avec les valeurs dont vous disposez, puis lisez le resultat ! \n\nLa puissance est calculée en fonction de l'intensitée, les deux sont donc remplie en même temps.",
              ),
            ],
          ),
        ),
      ),
      // //Debug
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
