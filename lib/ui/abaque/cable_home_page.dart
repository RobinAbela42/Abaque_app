import 'package:abaque_app/ui/abaque/intensity_query_mono.dart';
import 'package:abaque_app/ui/abaque/length_query_mono.dart';
import 'package:abaque_app/ui/abaque/section_query_mono.dart';
import 'package:flutter/material.dart';

class CableHomePage extends StatefulWidget {
  const CableHomePage({super.key});

  @override
  State<CableHomePage> createState() => _CableHomePageState();
}

class _CableHomePageState extends State<CableHomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AbaCalc',
          style: TextStyle(color: theme.colorScheme.surface),
        ),
        leading: Icon(Icons.home),
        backgroundColor: theme.colorScheme.primary,
      ),
      backgroundColor: theme.colorScheme.primaryContainer,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                textAlign: TextAlign.center,

                'Que voulez-vous calculer ?',
                softWrap: true,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.inverseSurface,
                ),
              ),
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: Image(image: AssetImage("assets/emojis/mascot_thinking.png")),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: BigCard(
                cardName: 'Longueur',
                cardSubtitle: 'Mètre (m)',
                widgetToGo: LengthQueryMono(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: BigCard(
                cardName: 'Section',
                cardSubtitle: 'Diamètre en milimètre carré (mm2)',
                widgetToGo: SectionQueryMono(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: BigCard(
                cardName: 'Intensité / Puissance',
                cardSubtitle: 'Ampères (A) / Watt (W)',
                widgetToGo: IntensityQueryMono(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.cardName,
    required this.widgetToGo,
    required this.cardSubtitle,
  });
  final String cardName;
  final String cardSubtitle;
  final Widget widgetToGo;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      color: theme.colorScheme.primary,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => widgetToGo),
          );
        },
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          title: Text(
            cardName,
            style: TextStyle(
              color: theme.colorScheme.surface,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            cardSubtitle,
            style: TextStyle(color: theme.colorScheme.surfaceDim),
          ),
          style: ListTileStyle.values.first,
          // width: 300,
          // height: 100,

          // child: Center(
          //   child: Text(
          //     cardName,
          //     style: TextStyle(
          //       fontSize: 18,
          //       fontFamily: "",
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
