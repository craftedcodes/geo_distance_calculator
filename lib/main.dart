import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'distance/application/distance_bloc.dart';
import 'distance/presentation/distance_screen.dart';

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
      home: BlocProvider(
        create: (context) => DistanceBloc(),
        child: const DistanceScreen(title: 'Geo Distance'),
      ),
    );
  }
}
