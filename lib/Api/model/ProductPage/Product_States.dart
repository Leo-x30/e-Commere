import 'package:e_commerce/Api/model/ProductPage/product_responce.dart';

abstract class ProductStates {}

class ProductInitialStates extends ProductStates {}

class ProductLoadingStates extends ProductStates {}

class ProductErrorStates extends ProductStates {
  String erorrMessage;
  ProductErrorStates({required this.erorrMessage});
}

class ProductSuccessStates extends ProductStates {
    ProductResponce response;
  ProductSuccessStates({required this.response});
}