import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/colors.dart';
import '../res/components/round_button.dart';
import '../utils/utils/Utils.dart';
import '../view_model/auth_viewmodel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
    final authViewModel = Provider.of<AuthViewModel>(context);
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
              title: 'Sign Up',
              loading: authViewModel.sLoading,
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
                  Map data = {
                    "email": emailCon.text.toString(),
                    "password": passCon.text.toString(),
                  };
                  authViewModel.register(data,context);
                  print('Api Hit');
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Text('Already Registered ? Login now',style: TextStyle(decoration: TextDecoration.underline),))
          ],
        ),
      ),
    );
  }
}
