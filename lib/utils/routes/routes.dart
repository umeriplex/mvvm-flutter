import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_vidoe_one/utils/routes/routes_name.dart';
import 'package:mvvm_vidoe_one/view/login_view.dart';
import 'package:mvvm_vidoe_one/view/signup_view.dart';

import '../../view/home_view.dart';
import '../../view/splash_view.dart';



class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
                child: Text(
              'No Route Define',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sans'),
            )),
          );
        });
    }
  }
}
