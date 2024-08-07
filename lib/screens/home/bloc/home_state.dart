part of 'home_bloc.dart';
class HomeState {
  final BlocStateStatus status;
  final List<DeviceModel>? devices;

  HomeState({required this.status, this.devices});

  factory HomeState.initial() => HomeState(
        status: BlocStateStatus.initial,
        devices: [],
      );

  HomeState copyWith({
    BlocStateStatus? status,
    List<DeviceModel>? devices,
  }) {
    return HomeState(
      status: status ?? this.status,
      devices: devices ?? this.devices,
    );
  }
}
