import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/user_modal.dart';

class UserViewModel with ChangeNotifier {

  Future<bool> saveUser(UserModal user) async {

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModal> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return UserModal(token: token.toString());
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return sp.clear();
  }
}
