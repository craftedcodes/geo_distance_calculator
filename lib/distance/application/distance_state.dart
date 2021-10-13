part of 'distance_bloc.dart';

enum DistanceFetchStatus { initial, loading, error, success }

@immutable
class DistanceState {
  const DistanceState(
      {this.distanceFromUser = '',
      this.hasPermission = true,
      this.isLocationEnabled = true,
      this.distanceFetchStatus = DistanceFetchStatus.initial});
  final String distanceFromUser;
  final bool hasPermission;
  final bool isLocationEnabled;
  final DistanceFetchStatus distanceFetchStatus;

  DistanceState copyWith({
    String? distanceFromUser,
    bool? hasPermission,
    bool? isLocationEnabled,
    DistanceFetchStatus? distanceFetchStatus,
  }) {
    return DistanceState(
      distanceFromUser: distanceFromUser ?? this.distanceFromUser,
      hasPermission: hasPermission ?? this.hasPermission,
      isLocationEnabled: isLocationEnabled ?? this.isLocationEnabled,
      distanceFetchStatus: distanceFetchStatus ?? this.distanceFetchStatus,
    );
  }
}
