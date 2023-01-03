import 'package:flutter/material.dart';
import 'package:mvvm_vidoe_one/view/splash_services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices ss = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ss.checkAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen',style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
