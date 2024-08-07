import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/models/device_model.dart';
import 'package:healthcare_wellness/repositories/device_repo.dart';
import 'package:healthcare_wellness/utils/enums.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext context;

  HomeBloc({required this.context}) : super(HomeState.initial()) {
    on<GetDeviceList>(
      (event, emit) async {
        // Show loading
        emit(state.copyWith(status: BlocStateStatus.loading));
        // Waiting to get the list of devices
        final repo = RepositoryProvider.of<DeviceRepository>(context);
        final data = await repo.getDevices();
        // Emit state
        if (data != null) {
          emit(state.copyWith(status: BlocStateStatus.success, devices: data));
        } else {
          emit(state.copyWith(status: BlocStateStatus.failed, devices: null));
        }
      },
    );
  }
}
