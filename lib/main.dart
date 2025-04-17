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
  // Length of the section wanted, in meters
  num length = 0;
  // num get length {
  //   return _length;
  // }
  // String get strLength {
  //   return _length.toString();
  // }
  // set length(value) {
  //   _length = value;
  // }

  // Diameter of the section wanted, in Squares Milimeters
  num section = 0;
  // Electrical outlet's Voltage, in Volt
  num voltage= 230;
  // Intensity of the installation, in Amps
  num intensity = 0;
  // Used material's resistance, copper by default since it's the most used, in Ohms
  num resistance = 0.021;
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
