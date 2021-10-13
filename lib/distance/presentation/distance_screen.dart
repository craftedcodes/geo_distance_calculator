import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_distance_calculator/distance/application/distance_bloc.dart';

class DistanceScreen extends StatefulWidget {
  const DistanceScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DistanceScreen> createState() => _DistanceScreenState();
}

class _DistanceScreenState extends State<DistanceScreen> {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Latitude',
                    fillColor: Colors.grey.withOpacity(.15),
                    filled: true,
                  ),
                  controller: latitudeController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Longitude',
                    fillColor: Colors.grey.withOpacity(.15),
                    filled: true,
                  ),
                  controller: longitudeController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => {
                  BlocProvider.of<DistanceBloc>(context).add(
                    DistanceFetched(
                        latitude: double.parse(latitudeController.value.text),
                        longitude:
                            double.parse(longitudeController.value.text)),
                  )
                },
                child: const Text('GET DISTANCE'),
              ),
              const SizedBox(
                height: 60,
              ),
              BlocBuilder<DistanceBloc, DistanceState>(
                builder: (context, state) {
                  return state.distanceFetchStatus ==
                          DistanceFetchStatus.success
                      ? Text(
                          'distance to current location: ${state.distanceFromUser} km')
                      : state.distanceFetchStatus == DistanceFetchStatus.loading
                          ? const LinearProgressIndicator()
                          : state.distanceFetchStatus ==
                                  DistanceFetchStatus.error
                              ? const Text('error')
                              : const Text(
                                  'please enter latitude and longitude');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
