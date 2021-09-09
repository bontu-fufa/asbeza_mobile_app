import 'package:asbeza_mobile_app/auth/data_providers/auth-data-provider.dart';
import 'package:asbeza_mobile_app/auth/models/new_user_model.dart';
import 'package:asbeza_mobile_app/auth/models/user_model.dart';

class AuthRepository {
  final AuthDataProvider dataProvider;
  AuthRepository(this.dataProvider);

  Future<NewUser> create(NewUser newUser) async {
    return this.dataProvider.create(newUser);
  }

  // Future<Course> update(int id, Course course) async {
  //   return this.dataProvider.update(id, course);
  // }

  // Future<List<Course>> fetchAll() async {
  //   return this.dataProvider.fetchAll();
  // }

  Future<dynamic> fetchByName(User user){
    return this.dataProvider.fetchByName(user);
  }

  // Future<void> delete(int id) async {
  //   this.dataProvider.delete(id);
  // }
}
