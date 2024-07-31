import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/screens/sign_up/bloc/sign_up_event.dart';
import 'package:healthcare_wellness/screens/sign_up/bloc/sign_up_state.dart';
import 'package:healthcare_wellness/utils/enums.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final BuildContext context;

  SignUpBloc({required this.context}) : super(SignUpState(status: BlocStateStatus.initial)) {
    on<OnSignUp>(
      (event, emit) async {
        // show loading
        emit(state.copyWith(status: BlocStateStatus.loading, isError: true));
        // call api
        debugPrint("====event=${event.email} ==== ${state.status}  isError = ${state.isError}");
        await Future.delayed(const Duration(seconds: 3));
        // emit trang thai success
        if (event.email.isEmpty) {
          emit(state.copyWith(status: BlocStateStatus.failed));
        } else {
          emit(state.copyWith(status: BlocStateStatus.success));
        }
        debugPrint("====event=${event.email} ==== ${state.status}  isEnabled = ${state.isError}");
      },
    );
  }
}

/// SignUpState: status = BlocStateStatus.initial, email = null, password= null, isEnableButton = null
