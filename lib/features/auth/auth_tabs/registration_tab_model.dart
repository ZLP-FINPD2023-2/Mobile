import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();

  DateTime? date;
  Future<void> setDate(BuildContext context) async {
    date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    String? dateOfBirth = date != null ? "${date?.day}.${date?.month}.${date?.year}" : "";
    dateController.text = dateOfBirth;
    notifyListeners();
  }

  


}