import 'package:asbeza_mobile_app/auth/models/models.dart';

import 'auth_event.dart';
import 'auth_state.dart';
import 'package:asbeza_mobile_app/auth/repository/auth-repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future addToSession(Map value) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setString("token", value['token']);
  prefs.setInt("user_id", value['user']['user_id']);
  prefs.setString("user_name", value['user']['user_name']);
  prefs.setString("email", value['user']['user_email']);
  prefs.setString("user_type", value['user']['user_type']);

  return prefs;
}

Future addToSessionNew(NewUser newUser) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setString("user_name", newUser.name);
  prefs.setString("email", newUser.email);

  return prefs;
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(LoggedOut());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      final user = event.user;

      yield LoginInProgress();

      // check name and password
      try {
        final userInfo = await authRepository.fetchByName(user);
        // print("USERINFO: $userInfo");
        addToSession(userInfo).then((value) => null);
        yield LoggedIn();
      } catch (e) {
        yield AuthFailed(errorMsg: "Account does not exist.");
      }
    }

    if (event is SignupEvent) {
      final newUser = event.newUser;

      yield SignupInProgress();

      // insert into db
      try {
        final userInfo = await authRepository.create(newUser);
        print("USERINFO: $userInfo");
        yield SignedUp();
      } catch (_) {
        yield AuthFailed(
            errorMsg: "Account exists. Login or change username and/or email.");
      }
    }

    if (event is UpdateProfileEvent) {
      final id = event.id;
      final user = event.newUser;

      yield UpdateProfileInProgress();
      // insert into db
      try {
        print("USER: ${user.name}");
        final userInfo = await authRepository.update(id, user);
        print("USERINFO from bloc: $userInfo");
        addToSessionNew(userInfo).then((value) => null);
        yield UpdatedProfile();
      } catch (e) {
        print(e);
        yield AuthFailed(
            errorMsg: "Account exists. Login or change username and/or email.");
      }
    }

    if (event is DeleteAccountEvent) {
      final id = event.id;

      yield DeleteAccountInProgress();
      try {
        final result = await authRepository.delete(id);
        final clear = await _prefs.then((value) => value.clear());
        _prefs.then((value) {
          print(value.getString("user_name"));
        });
        yield DeletedAccount();
      } catch (e) {
        print(e);
        yield AuthFailed(errorMsg: "Could not delete account. Try again");
      }
    }

    if (event is LogoutEvent) {
      await _prefs.then((value) => value.clear());
      yield LoggedOut();
    }
  }
}
