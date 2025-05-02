import 'package:abaque_app/ui/abaque/intensity_query_mono.dart';
import 'package:abaque_app/ui/abaque/length_query_mono.dart';
import 'package:abaque_app/ui/abaque/section_query_mono.dart';
import 'package:abaque_app/ui/abaque/widgets/help_button.dart';
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
          'AbaCâble',
          style: TextStyle(color: theme.colorScheme.surface),
        ),
        leading: Icon(Icons.home),
        backgroundColor: theme.colorScheme.primary,
      ),
      backgroundColor: theme.colorScheme.primaryFixedDim,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  textAlign: TextAlign.center,

                  'Que voulez-vous calculer ?',
                  softWrap: true,
                  style: TextStyle(
                    height: 1,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.inverseSurface,
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Image(image: AssetImage("assets/emojis/thinking-2.png")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: BigCard(
                  cardName: 'La longueur ?',
                  cardSubtitle: 'Mètre (m)',
                  widgetToGo: LengthQueryMono(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: BigCard(
                  cardName: 'La section ?',
                  cardSubtitle: 'Milimètre carré (mm2)',
                  widgetToGo: SectionQueryMono(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: BigCard(
                  cardName: 'L\'intensité, puissance ?',
                  cardSubtitle: 'Ampères (A) / Watt (W)',
                  widgetToGo: IntensityQueryMono(),
                ),
              ),
              HelpButton(text: "Une Abaque est un tableau grâce auquel on peut trouver les bonnes façons de poser des câbles, sans surchauffe de ces derniers par exemple.\n\nCette application fait la même chose, en plus simple ! On vous aide à trouver la longueur parfaite, la section idéale, ou l'intensitée maximum sur une installation. \n\nCliquez sur ce même bouton dans les pages pour voir avoir plus de détails !")
            ],
          ),
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
        ),
      ),
    );
  }
}
