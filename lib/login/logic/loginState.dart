import 'package:qara/login/data/data.dart';

class LoginState {
  final String email;
  final String password;
  final LoginRsponces ?respoce;

  LoginState({
    this.email = '',
    this.password = '',
    this.respoce,
  });

  LoginState copyWith({
    String? email,
    String? password,
    LoginRsponces  ? respoce,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      respoce:respoce ?? this.respoce,
    );
  }
}
