import 'package:e_commerce/Api/Api_manager.dart';
import 'package:e_commerce/Api/model/ProductPage/Product_States.dart';
import 'package:e_commerce/Api/model/ProductPage/product_responce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialStates());
  List<Data> Product = [];
  void getAllproduct() async {
    try {
      emit(ProductLoadingStates());

      var response = await Api_maneger.GetAllProduct();
      if (response.statusMsg == 'fail') {
        emit(ProductErrorStates(erorrMessage: response.message!));



      } else {
        Product = response.data ?? [];
        emit(ProductSuccessStates(response: response));
      }
    } catch (e) {
      emit(ProductErrorStates(erorrMessage: e.toString()));
    }
  }
}
