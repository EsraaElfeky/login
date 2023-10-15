import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginState.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  void login(String email, String password) {
    emit(state.copyWith(email: email, password: password));
  }
}