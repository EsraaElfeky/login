import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qara/dio/dio.dart';
import 'package:qara/login/data/data.dart';

import 'loginState.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  
  void login(String email, String password) async {
    final result = await DioHelper.postData(
      url: '/auth/login',
      query: null,
      data: {
        'username': email,
        'password': password,
      },
    );

    LoginRsponces respoce = LoginRsponces.fromMap(result.data);

    print(result.data['firstName'] + result.data['lastName']);
    print(respoce.firstName + respoce.lastName);
    emit(state.copyWith(email: email, password: password));
  }
}
