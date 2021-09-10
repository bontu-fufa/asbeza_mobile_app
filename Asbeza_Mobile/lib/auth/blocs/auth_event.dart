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

class UpdateProfileEvent extends AuthEvent {
  final int id;
  final NewUser newUser;

  UpdateProfileEvent({required this.id, required this.newUser});
}

class DeleteAccountEvent extends AuthEvent {
  final int id;

  DeleteAccountEvent({required this.id});
}

class LogoutEvent extends AuthEvent {}