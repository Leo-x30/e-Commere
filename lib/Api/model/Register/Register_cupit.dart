import 'package:e_commerce/Api/Api_manager.dart';
import 'package:e_commerce/Api/model/Register/Register_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCupit extends Cubit<RegisterStates> {
  RegisterCupit() : super(RegisterInitialStates());
  var formKey = GlobalKey<FormState>();
  var obscureText = false;
  var nameController = TextEditingController(text: "");
  var phoneController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "123456");
  var repasswordController = TextEditingController(text: "123456");

  void register() async {
    try {
      emit(RegisterLoadingStates());
      var response = await Api_maneger.Register(
          nameController.text,
          emailController.text,
          passwordController.text,
          repasswordController.text,
          phoneController.text);
      if (response.statusMsg == 'fail') {
        emit(RegisterErrorStates(errorMessage: response.message!));
      } else {
        emit(RegisterSuccessStates(response: response));
      }
    } catch (e) {
      emit(RegisterErrorStates(errorMessage: e.toString()));
    }
  }
}
