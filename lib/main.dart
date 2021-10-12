import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geo Distance Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Geo Distance'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController latitudeController;
  late TextEditingController longitudeController;

  @override
  void initState() {
    super.initState();
    latitudeController = TextEditingController();
    longitudeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: latitudeController,
          ),
          TextField(
            controller: longitudeController,
          ),
          TextButton(
            onPressed: () => {},
            child: const Text('GET DISTANCE'),
          ),
          const Text('distance to current location: km'),
        ]),
      ),
    );
  }
}
