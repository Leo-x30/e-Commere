import 'package:e_commerce/Api/Api_manager.dart';
import 'package:e_commerce/Api/model/Login/Login_States.dart';
import 'package:e_commerce/Api/model/Login/login_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCupit extends Cubit<LoginStates> {
  LoginCupit() : super(LoginIntialStates());
  var formKey = GlobalKey<FormState>();
  var obscureText = false;

  var emailController = TextEditingController(text: "abdo");
  var passwordController = TextEditingController(text: "123456");

  void Login() async {
    try {
      emit(LoginLoadingStates());
      LoginResponse response = await Api_maneger.Login(
          emailController.text, passwordController.text);

      if (response.statusMsg == 'fail') {
        emit(LoadingerrorStates(errorMessage: response.message!));
      } else {
        emit(LoginSuccessStates(response: response));
      }
    } catch (e) {
      emit(LoadingerrorStates(errorMessage: e.toString()));
    }
  }
}
