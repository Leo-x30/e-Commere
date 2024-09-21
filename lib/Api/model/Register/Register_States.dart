import 'package:e_commerce/Api/model/Register/register_response.dart';

abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterErrorStates extends RegisterStates {
  String errorMessage;
  RegisterErrorStates({required this.errorMessage});
}

class RegisterSuccessStates extends RegisterStates {
    RegisterResponse response;
  RegisterSuccessStates({required this.response});
}
