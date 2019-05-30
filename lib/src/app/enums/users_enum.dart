enum AuthMethod { EmailAndPassword, PhoneNumber }

enum AuthError {
  UserNotFound,
  EmailNotValid,
  PasswordNotValid,
  WeakPassword,
  NotAuthorized,
  NetworkError,
  UnknownError,
}

enum AuthStatus {
  Busy,
  Successful,
  Failed,
}
