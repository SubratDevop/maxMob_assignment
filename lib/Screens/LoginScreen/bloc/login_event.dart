part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LogInbuttonPressed extends LoginEvent {
  final String username;
  final String password;

  LogInbuttonPressed({
    required this.username,
    required this.password,
  });
}
