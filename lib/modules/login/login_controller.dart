import 'package:beauty_flutter/shared/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final Function onUpdate;
  var userModel = UserModel(name: '', email: '', password: '');

  LoginController({required this.onUpdate});

  Future<void> saveUser() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = await instance.setString("user", userModel.toJson());
      if (response) {
        print('user has been saved');
      } else {
        print('error on save');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUser() async {
    onUpdate();
    final instance = await SharedPreferences.getInstance();
    final response = instance.getString("user");
    if (response != null) {
      final user = UserModel.fromJson(response);
      userModel = user;
      onUpdate();
    }
  }
}
