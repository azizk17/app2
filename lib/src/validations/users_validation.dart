import 'package:flutter_form_builder/flutter_form_builder.dart';

class UsersValidation {
  static isExit(val) async {
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      if (val == "yes@yes.yes") {
        return "Email already has been used";
      }
    });
  }
}
