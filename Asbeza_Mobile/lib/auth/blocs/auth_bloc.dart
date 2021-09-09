import 'auth_event.dart';
import 'auth_state.dart';
import 'package:asbeza_mobile_app/auth/repository/auth-repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asbeza_mobile_app/auth/models/models.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(LoggedOut());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      final user = event.user;

      yield LoginInProgress();
      
      // check name and password
      final userInfo = await authRepository.fetchByName(user);
      if (userInfo['message'] == 'logged in') {
        print("Logged in successfully");
        yield LoggedIn();
      } else {
        print("Logging in not successful");
        yield AuthFailed(errorMsg: "Account does not exist.");
      }
    } 

    if (event is SignupEvent) {
      final newUser = event.newUser;

      yield SignupInProgress();

      // insert into db
      try {
        final userInfo = await authRepository.create(newUser);
        yield SignedUp();
      } catch (_) {
        yield AuthFailed(errorMsg: "Account exists. Login or change username and/or email.");
      }
    }
    
  }
}