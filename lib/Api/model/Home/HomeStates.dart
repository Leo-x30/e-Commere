import 'package:e_commerce/Api/model/Home/categoryOrBrand_response.dart';

abstract class HomeStates{}
class HomeCategoryIntialStates extends HomeStates {}
class HomeCategoryLoadingStates extends HomeStates {}

class HomeCategoryErrorStates extends HomeStates {
  String errorMessage;
  HomeCategoryErrorStates({required this.errorMessage});
}

class HomeCategorySuccessStates extends HomeStates {

    CategoryrOrBrandResponse response;
  HomeCategorySuccessStates({required this.response});
}

