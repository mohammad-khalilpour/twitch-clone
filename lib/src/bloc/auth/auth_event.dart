part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AppEventUploadImage implements AuthEvent {
  final String filePathToUpload;

  const AppEventUploadImage({
    required this.filePathToUpload,
  });
}


class AppEventDeleteAccount implements AuthEvent {
  const AppEventDeleteAccount();
}


class AppEventLogOut implements AuthEvent {
  const AppEventLogOut();
}


class AppEventInitialize implements AuthEvent {
  const AppEventInitialize();
}


class AppEventLogIn implements AuthEvent {
  final String email;
  final String password;

  const AppEventLogIn({
    required this.email,
    required this.password,
  });
}


class AppEventRegister implements AuthEvent {
  final String email;
  final String password;
  final String username;

  const AppEventRegister({
    required this.email,
    required this.password,
    required this.username,
  });
}
