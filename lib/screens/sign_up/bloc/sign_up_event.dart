abstract class SignUpEvent {}

class OnSignUp extends SignUpEvent {
  final String email;
  final String password;

  OnSignUp({required this.email, required this.password});
}

class OnForgotPassword extends SignUpEvent {
  final String email;
  OnForgotPassword({required this.email});
}
