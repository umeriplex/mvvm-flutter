import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {

  //TODO this is static global toast for all application
  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.cyan,
        textColor: Colors.black54,
        toastLength: Toast.LENGTH_SHORT);
  }

  //TODO this is static global flushBar for all application
  static void flushErrorMsg(String msg, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: msg,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
          backgroundColor: Colors.teal,
          titleColor: Colors.white,
          flushbarPosition: FlushbarPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          icon: const Icon(Icons.report_gmailerrorred_rounded,color: Colors.white,),
        )..show(context)
    );
  }

  //TODO this is static global snackBar for all application
  static snackBar(String msg, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg))
    );
  }

  //TODO this is static global focus changing method for TextFields
  static focusChange(BuildContext context, FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

}
