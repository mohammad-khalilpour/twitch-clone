import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:twitch_clone/src/resources/auth.dart';
import '../../errors/auth_error.dart';
import '../../models/user.dart' as model;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthMethods _authMethods = AuthMethods();

  AuthBloc()
      : super(
          const AppStateLoggedOut(isLoading: false),
        ) {
    on<AppEventInitialize>(_initialize);
    on<AppEventRegister>(_register);
    on<AppEventLogIn>(_logIn);
  }

  FutureOr<void> _register(
    AppEventRegister event,
    Emitter<AuthState> emit,
  ) async {
    final email = event.email;
    final password = event.password;
    final username = event.username;

    String res = await _authMethods.signUpUser(
        email: email, username: username, password: password);
    if (res == "success") {


      emit(
        const AppStateIsInOtpScreen(
          isLoading: false,
        ),
      );
    } else {
      emit(
        AppStateLoggedOut(isLoading: false, authError: AuthError.from(res)),
      );
    }
  }

  FutureOr<void> _logIn(
    AppEventLogIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      const AppStateLoggedOut(
        isLoading: true,
      ),
    );
    _authMethods.logIn(
      email: event.email,
      password: event.password,
    );
    emit(
      AppStateLoggedIn(
        isLoading: false,
        user: (await _authMethods.getUserDetails())!,
      ),
    );
  }

  FutureOr<void> _initialize(
    AppEventInitialize event,
    Emitter<AuthState> emit,
  ) async {
    final user = await _authMethods.getUserDetails();
    if (user == null) {
      emit(
        const AppStateLoggedOut(
          isLoading: false,
        ),
      );
    } else if (!user.emailIsVerified) {
      emit(const AppStateIsInOtpScreen(isLoading: false));
    } else {
      emit(
        AppStateLoggedIn(
          isLoading: false,
          user: user,
        ),
      );
    }
  }
}
