abstract class AuthState {}

class LoginInProgress extends AuthState {}

class LoggedIn extends AuthState {}

class LoggedOut extends AuthState {}

class SignupInProgress extends AuthState {}

class SignedUp extends AuthState {}

class UpdateProfileInProgress extends AuthState {}

class UpdatedProfile extends AuthState {}

class DeleteAccountInProgress extends AuthState {}

class DeletedAccount extends AuthState {}

class AuthFailed extends AuthState {
  final errorMsg;

  AuthFailed({required this.errorMsg});
}