import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'distance_event.dart';
part 'distance_state.dart';

class DistanceBloc extends Bloc<DistanceEvent, DistanceState> {
  DistanceBloc()
      : geolocator = Geolocator(),
        super(const DistanceState()) {
    on<DistanceEvent>((event, emit) async {
      if (event is DistanceFetched) {
        {
          bool serviceEnabled;
          LocationPermission permission;

          serviceEnabled = await Geolocator.isLocationServiceEnabled();
          if (!serviceEnabled) {
            emit(state.copyWith(isLocationEnabled: false));
            return;
          }

          permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
              emit(state.copyWith(hasPermission: false));
              return;
            }
          }

          if (permission == LocationPermission.deniedForever) {
            emit(state.copyWith(hasPermission: false));
            return;
          }
          emit(
              state.copyWith(distanceFetchStatus: DistanceFetchStatus.loading));
          final userLoc = await Geolocator.getCurrentPosition();
          final distance = (Geolocator.distanceBetween(userLoc.latitude,
                      userLoc.longitude, event.latitude, event.longitude) /
                  1000)
              .toStringAsFixed(2);
          emit(state.copyWith(
              distanceFetchStatus: DistanceFetchStatus.success,
              distanceFromUser: distance.toString()));
        }
      }
    });
  }
  final Geolocator geolocator;
}
