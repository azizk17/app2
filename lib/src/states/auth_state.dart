import 'dart:async';
import 'package:app2/src/app/enums/enums.dart';
import 'package:app2/src/app/enums/users_enum.dart';
import 'package:app2/src/states/base_state.dart';
import 'package:app2/src/repository/repository.dart';
import 'package:flutter/services.dart';
import 'package:app2/src/models/models.dart';
import 'package:app2/src/app/enums/enums.dart';

import 'package:meta/meta.dart';

class AuthForm {
  final String email;
  final String password;
  final bool isLoading;
  final bool canSubmit;
  final bool sucsses;
  AuthForm(
      {this.email = "",
      this.password: "",
      this.isLoading,
      this.canSubmit,
      this.sucsses});
  AuthForm copyWith({
    String email,
    String password,
    bool isLoading,
    bool submitted,
  }) {
    return AuthForm(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      canSubmit: canSubmit ?? this.canSubmit,
      sucsses: sucsses ?? this.sucsses,
    );
  }
}

class FormError {
  final String code;
  final String message;
  final String filed;
  FormError({this.code = "", this.message = "", this.filed = ""});
  FormError copyWith({String code, String message, String filed}) {
    return FormError(
      code: code ?? this.code,
      message: message ?? this.message,
      filed: filed ?? this.filed,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Error code: $code in $filed";
  }
}

class AuthState extends BaseState {
  // TODO: Form validitions and trim
  final _authRepo = AuthRepository();

  User get authUser => _authUser;
  User _authUser;
  AuthError _erros;
  AuthStatus _authStatus;
  AuthError get authError => _erros;
  AuthStatus get authStatus => _authStatus;
  // PublishSubject<FormStatus> _formStatus = PublishSubject<FormStatus>();
  // Stream<FormStatus> get authFormStream => _formStatus.stream;
  // Function(FormStatus) get authFormUpdate => _formStatus.sink.add;
  Function get register => _register;
  Function get signIn => _signIn;
  Function get signOut => _signOut;
  bool get isLoggendIn => _authUser != null ? true : false;

  void _setAuthError(AuthError error) {
    _erros = error;
    notifyListeners();
  }

  void _setAuthStatus(AuthStatus status) {
    _authStatus = status;
    notifyListeners();
  }

  void _setAuthUser(User user) {
    _authUser = user;
    notifyListeners();
  }

  AuthState() {
    // rest data
    this.reset();
    notifyListeners();
  }
  void _signOut() {
    // TODO: repo call to remove user from local db
    this.reset();
    this._setAuthUser(null);
    notifyListeners();
  }
  Future<AuthStatus> _register(
      {@required Map<String, String> credentials, AuthMethod method}) async {
    try {
      print("DATA1" + credentials.toString());
      // set busy
      _setAuthStatus(AuthStatus.Busy);
      // service call
      User _u =
          await _authRepo.register(credentials: credentials, method: method);
      _setAuthStatus(AuthStatus.Successful);
      _setAuthUser(_u);
      return this.authStatus;
    } catch (e) {
      print("What err" + e.toString());
      AuthError _err = _getException(e);
      _setAuthError(_err);
      _setAuthStatus(AuthStatus.Failed);
      return AuthStatus.Failed;
    }
    // set and return status
  }

  // sgin in
  Future<AuthStatus> _signIn({
    @required Map<String, String> credentials,
    AuthMethod method,
  }) async {
    //
    try {
      _setAuthStatus(AuthStatus.Busy);

      User _user = await _authRepo.signIn(credentials: credentials, method: method);
      _setAuthStatus(AuthStatus.Successful);
      _setAuthUser(_user);

      return AuthStatus.Successful;
    } catch (e) {
      AuthError _err = _getException(e);
      _setAuthError(_err);
      _setAuthStatus(AuthStatus.Failed);
      return AuthStatus.Failed;
    }
  }

  /*
   *  Handle Api calls exceptions
   */
  AuthError _getException(Exception e) {
    print("ERR: " + e.toString());
    if (e is PlatformException) {
      print(e.code + " " + e.message);
      switch (e.code) {
        case "ERROR_WRONG_PASSWORD":
          return AuthError.PasswordNotValid;
          break;
        case "ERROR_USER_NOT_FOUND":
          return AuthError.UserNotFound;
          break;
        case "ERROR_INVALID_EMAIL":
          return AuthError.EmailNotValid;
          break;
        default:
          return AuthError.UnknownError;
      }
    } else {
      return AuthError.UnknownError;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void reset() {
    // TODO: implement reset
    _setAuthError(null);
    _setAuthStatus(null);
    super.reset();
  }
}