
import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:clean_code/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static void fieldFocusChange(BuildContext context,FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        backgroundColor: Colors.black87,
        fontSize: 15,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        msg: message
    );
  }

  static void flushBarErrorMessage(String message,BuildContext context){
    showFlushbar(context: context,
        flushbar:Flushbar(
          borderRadius: BorderRadius.circular(20),
          forwardAnimationCurve: Curves.bounceIn,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          message: message,
          backgroundColor: AppColors.flushColor,
          title: "Message",
          messageColor: Colors.white,
          duration:const Duration(seconds: 5),
          reverseAnimationCurve: Curves.easeOut,
          titleColor: Colors.white,
          icon: const Icon(
              Icons.account_balance_wallet,color: Colors.white),
        )..show(context),
    );
  }
  
  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.green,
          content: Text(
              message.toString()
          )
      )
    );
  }
}