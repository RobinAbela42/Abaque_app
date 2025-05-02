import 'package:flutter/material.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({super.key, required  this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: InkWell(
        child: Text(
          'Besoin d\'aide ?',
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Explication",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        text,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
