abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String name;
  final String password;

  LoginEvent({required this.name, required this.password});
}

class SignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignupEvent({required this.name, required this.email, required this.password});
}