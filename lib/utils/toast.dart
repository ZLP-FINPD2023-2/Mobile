// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// void showErrorToast(BlocNetworkError err) {
//   var errText = '';
//   if (err.error != null) {
//     errText += '${err.error}';
//   }
//   /*else {
//     errText += 'error';
//   }*/
//   if (err.message != null) {
//     if (errText.isNotEmpty) errText += '\n';
//     errText += '${err.message}';
//   }
//   if (err.details != null) {
//     if (errText.isNotEmpty) errText += '\n';
//     errText += '${err.details}';
//   }
//   Fluttertoast.showToast(
//     msg: errText,
//     toastLength: Toast.LENGTH_LONG,
//     //gravity: ToastGravity.BOTTOM,git
//     timeInSecForIosWeb: 5,
//     /* backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0*/
//   );
// }

// void showToast(String message, {Color? backgroundColor, ToastGravity? gravity, double? fontSize, int? timeInSec}) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_SHORT,
//     timeInSecForIosWeb: timeInSec ?? 2,
//     backgroundColor: backgroundColor,
//     gravity: gravity,
//     fontSize: fontSize,
//   );
// }
