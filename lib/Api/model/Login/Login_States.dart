import 'package:e_commerce/Api/model/Login/login_response.dart';

abstract class LoginStates {}

class LoginIntialStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoadingerrorStates extends LoginStates {
  String errorMessage;
  LoadingerrorStates({required this.errorMessage});
}

class LoginSuccessStates extends LoginStates {
    LoginResponse response;
    LoginSuccessStates({required this.response});
}
