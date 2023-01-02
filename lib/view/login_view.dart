import 'package:flutter/material.dart';
import 'package:mvvm_vidoe_one/res/colors.dart';
import 'package:mvvm_vidoe_one/utils/routes/routes_name.dart';
import 'package:mvvm_vidoe_one/utils/utils/Utils.dart';

import '../res/components/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  FocusNode EFn = FocusNode();
  FocusNode PFn = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailCon.dispose();
    passCon.dispose();
    EFn.dispose();
    PFn.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: AppColors.tealColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailCon,
              focusNode: EFn,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColors.tealColor,
                  )),
              onFieldSubmitted: (value) {
                Utils.focusChange(context, EFn, PFn);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: _obscurePassword.value,
                    controller: passCon,
                    focusNode: PFn,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: InkWell(
                          onTap: () {
                            _obscurePassword.value = !_obscurePassword.value;
                          },
                          child: _obscurePassword.value == true
                              ? const Icon(
                                  Icons.lock_outline,
                                  color: AppColors.tealColor,
                                )
                              : const Icon(
                                  Icons.lock_open,
                                  color: AppColors.tealColor,
                                ),
                        )),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus();
                    },
                  );
                }),
            SizedBox(
              height: height * .09,
            ),
            RoundButton(
              title: 'Log in',
              loading: true,
              color: AppColors.tealColor,
              onPress: () {
                if (emailCon.text.isEmpty) {
                  Utils.flushErrorMsg('Email can`t be empty!!', context);
                } else if (passCon.text.isEmpty) {
                  Utils.flushErrorMsg('Password can`t be empty!!', context);
                } else if (passCon.text.length < 6) {
                  Utils.flushErrorMsg(
                      'Password can`t be less then 6 digits!!', context);
                } else {
                  print('Api Hit');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
