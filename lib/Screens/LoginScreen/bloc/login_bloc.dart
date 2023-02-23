import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LogInbuttonPressed>((event, emit) {
  
      // if (event.username == "user@maxmobility.in" &&
      if (event.username == "us@gmail.com" &&
          event.password.isNotEmpty) {
        emit(LoginLoaded());
      } else {
        emit(LoginFailure());
      }
    });
  }
}
