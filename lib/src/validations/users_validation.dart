import 'package:app2/src/app/enums/enums.dart';
import 'package:app2/src/models/models.dart';
import 'package:app2/src/validations/base_validation.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:validators/validators.dart';

class UsersValidation extends BaseValidation {
  // get addError => addError;
  /**
   * 
   * overide a check function - BaseValidation
   */
  @override
  check(String field, User user) {
    switch (field) {
      case "name":
        if (user.name.length < 3) {
          super.addError(
              key: "name", code: "EEERT", message: "NAME IS VERY LONG");
        }
        break;
      case "email":
        if (user.email.length < 3) {
          addError(
              key: "email", code: "EMALEE WN", message: "EMAIL MUST BE LONGER");
        }
        if (user.email.length > 6) {
          addError(
              key: "email", code: "EMALEE WN", message: "EMAIL is very long");
        }
        break;
      default:
        print("NO ERRORS");
        return null;
    }
  }
}
