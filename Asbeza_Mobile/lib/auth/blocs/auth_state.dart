abstract class AuthState {}

class LoginInProgress extends AuthState {}

class LoggedIn extends AuthState {}

class LoggedOut extends AuthState {}

class SignupInProgress extends AuthState {}

class SignedUp extends AuthState {}

class AuthFailed extends AuthState {}