import 'package:e_commerce/Api/model/Home/HomeStates.dart';
import 'package:e_commerce/Api/model/Home/categoryOrBrand_response.dart';

class HomeBrandIntialStates extends HomeStates {}
class HomeBrandLoadingStates extends HomeStates {}

class HomeBrandErrorStates extends HomeStates {
  String errorMessage;
  HomeBrandErrorStates({required this.errorMessage});
}

class HomeBrandSuccessStates extends HomeStates {

  CategoryrOrBrandResponse response;
  HomeBrandSuccessStates({required this.response});
}
