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
      final name = event.name;
      final password = event.password;
      final user = User(name: name, password: password);

      yield LoginInProgress();
      
      // check name and password
      authRepository.fetchByName(user);
    } 

    if (event is SignupEvent) {
      final name = event.name;
      final email = event.email;
      final password = event.password;

      yield 
    }
    
  }
}