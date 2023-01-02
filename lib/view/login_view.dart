import 'package:flutter/material.dart';
import 'package:mvvm_vidoe_one/utils/routes/routes_name.dart';
import 'package:mvvm_vidoe_one/utils/utils/Utils.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.teal,
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
                    color: Colors.teal,
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
                builder: (context,value,child){
                  return TextFormField(
                    obscureText: _obscurePassword.value,
                    controller: passCon,
                    focusNode: PFn,
                    decoration:  InputDecoration(
                        hintText: 'Password',
                        prefixIcon: InkWell(
                            onTap: (){
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                            child: _obscurePassword.value == true ? Icon(Icons.lock_outline,color: Colors.teal,) :Icon(Icons.lock_open,color: Colors.teal,),
                        )
                    ),
                    onFieldSubmitted: (value){
                      FocusScope.of(context).requestFocus();
                    },
                  );
                }
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                //Utils.toastMessage('Button Pressed!');
                //Utils.flushErrorMsg('FlushBar Pressed!',context);
                //Utils.snackBar('SnackBar Pressed', context);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                    child: Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
