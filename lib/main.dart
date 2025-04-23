import 'package:abaque_app/ui/abaque/cable_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'App_name',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomePage(title: 'App_name Home PAGE'),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {


}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ButtonStyle menuButton = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0x00FF0000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(
                'Choisir sa section ou la longueur du câble souhaité :',
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                style: menuButton,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CableHomePage(),
                    ),
                  );
                },
                child: const Text('Section cable'),
              ),
              Text(
                'Applications des normes C15-100',
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                style: menuButton,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CableHomePage(),
                    ),
                  );
                },
                child: const Text('Section cable'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
