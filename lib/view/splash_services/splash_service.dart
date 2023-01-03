import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_vidoe_one/utils/routes/routes_name.dart';
import 'package:mvvm_vidoe_one/view_model/user_viewmodel.dart';

import '../../modal/user_modal.dart';

class SplashServices {

  Future<UserModal> getUserData() => UserViewModel().getUser();

  void checkAuth(BuildContext context) async {

    getUserData().then((value) async {
      print(value.token.toString());
      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.login, (Route<dynamic> route) => false);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.home, (Route<dynamic> route) => false);
      }
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
