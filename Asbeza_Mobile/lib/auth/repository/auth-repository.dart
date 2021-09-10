import 'package:asbeza_mobile_app/auth/data_providers/auth-data-provider.dart';
import 'package:asbeza_mobile_app/auth/models/new_user_model.dart';
import 'package:asbeza_mobile_app/auth/models/user_model.dart';

class AuthRepository {
  final AuthDataProvider dataProvider;
  AuthRepository({required this.dataProvider});

  Future<NewUser> create(NewUser newUser) async {
    return this.dataProvider.create(newUser);
  }

  Future<dynamic> fetchByName(User user){
    return this.dataProvider.fetchByName(user);
  }

  Future<dynamic> update(int id, NewUser user) async {
    return this.dataProvider.update(id, user);
  }

  Future delete(int id) async {
    return this.dataProvider.delete(id);
  }
}
