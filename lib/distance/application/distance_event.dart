part of 'distance_bloc.dart';

@immutable
abstract class DistanceEvent {}

class DistanceFetched extends DistanceEvent {
  DistanceFetched({required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
}
