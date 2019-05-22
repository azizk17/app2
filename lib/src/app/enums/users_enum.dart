enum AuthMethod { EmailAndPassword, PhoneNumber }

enum AuthError {
  UserNotFound,
  EmailNotValid,
  PasswordNotValid,
  WeakPassword,
  NetworkError,
  UnknownError,
}

enum AuthStatus {
  Busy,
  Successful,
  Failed,
}
