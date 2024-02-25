import 'package:fin_app/core/app_state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showErrorToast(AppStateWrong err) {
  var errText = '';

  if (err.key != null) {
    errText += '${err.key}';
  }

  if (errText.isNotEmpty) errText += '\n';

  errText += err.message;

  if (err.details != null) {
    if (errText.isNotEmpty) errText += '\n';
    errText += '${err.details}';
  }

  Fluttertoast.showToast(
    msg: errText,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 5,
  );
}

void showToast(
  String message, {
  Color? backgroundColor,
  ToastGravity? gravity,
  double? fontSize,
  int? timeInSec,
  Color? textColor,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: timeInSec ?? 2,
    backgroundColor: backgroundColor,
    gravity: gravity,
    fontSize: fontSize,
    textColor: textColor,
  );
}
