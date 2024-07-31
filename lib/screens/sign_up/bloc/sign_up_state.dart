// Define trang thai cua man hinh

import 'package:healthcare_wellness/utils/enums.dart';

class SignUpState {
  final BlocStateStatus status;
  final bool? isEnabledButton;
  final bool? isError;

  SignUpState({
    this.isEnabledButton,
    this.isError,
    required this.status,
  });

  SignUpState copyWith({
    BlocStateStatus? status,
    bool? isEnabledButton,
    bool? isError,
  }) {
    return SignUpState(
        status: status ?? this.status,
        isEnabledButton: isEnabledButton ?? this.isEnabledButton,
        isError: isError);
  }
}
