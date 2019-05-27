import 'package:app2/src/models/models.dart';
import 'package:app2/src/validations/errors_validation.dart';
import 'package:flutter/foundation.dart';

abstract class BaseValidation {
  Map<String, FormError> _errors;

  Map<String, FormError> errors;

  // factory BaseValidation._() => null;

  FormError getError(String field) {
    if (_errors.containsKey(field)) {
      return _errors[field];
    }
    return null;
  }

  bool hasError(String feild) {
    if (_errors.containsKey(feild)) {
      return true;
    }
    return false;
  }

  // very usefule in show an error besed on user behaviour
  bool showError(String f) {
    // TODO: errors display logic
    return hasError(f);
  }

  /**
   * 
   *  validation 
   *  @fields include all fields that must be validated
   * this is very usefule to filter a form fields
   */
  Map<String, FormError> validate(User user, {List fields}) {
    var b = _getKeys(user);
    for (var f in fields) {
      if (b.contains(f)) {
        // check for values are valid
        // errors are added to errors list
        this.check(f, user);
        // check error list

        // print("ERROS" + _fErrors.toString());
      } else {
        //
        throw new FlutterError("$f field is missing");
      }
    }
    if (this._errors != null) {
      return this._errors;
    }
    return null;
  }

  void addError({String message, String code, String key}) {
    FormError e = FormError(
      message: message != null ? message : "",
      code: code != null ? code : "",
      // key: key != null ? key : "",
    );
    this._errors[key] = e;
  }

  void _removeError(FormError e) {}
  void check(String field, User user) {}

  Iterable<String> _getKeys(User user) {
    return user.toJson().keys;
  }
}
