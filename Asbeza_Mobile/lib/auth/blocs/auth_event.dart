import 'package:asbeza_mobile_app/auth/models/models.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final User user;

  LoginEvent({required this.user});
}

class SignupEvent extends AuthEvent {
  final NewUser newUser;

  SignupEvent({required this.newUser});
}