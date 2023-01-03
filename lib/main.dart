import 'package:flutter/material.dart';
import 'package:mvvm_vidoe_one/res/colors.dart';
import 'package:mvvm_vidoe_one/utils/routes/routes.dart';
import 'package:mvvm_vidoe_one/utils/routes/routes_name.dart';
import 'package:mvvm_vidoe_one/view/login_view.dart';
import 'package:mvvm_vidoe_one/view_model/auth_viewmodel.dart';
import 'package:mvvm_vidoe_one/view_model/home_viewmodal.dart';
import 'package:mvvm_vidoe_one/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}

