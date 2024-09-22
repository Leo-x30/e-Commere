
import 'package:e_commerce/Api/Api_manager.dart';
import 'package:e_commerce/Api/model/Cart/CartResponse.dart';
import 'package:e_commerce/Api/model/Cart/Cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartviewmodel extends Cubit<CartStates> {
  Cartviewmodel() : super(GetCartInitialStates());
  List<GetProductCart> productList = [];

  void getCart() async {
    emit(GetCartLoadingStates());
    var either = await Api_maneger.getCart();
    either.fold((l) => emit(GetCartErrorStates(failures: l)), (response) {
      productList = response.data!.products ?? [];
      emit(GetCartSuccessStates(getCartResponse: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingStates());
    var either = await Api_maneger.getCart();
    either.fold((l) => emit(DeleteItemInCartErrorStates(failures: l)),
            (response) {
          productList = response.data!.products ?? [];
          emit(GetCartSuccessStates(getCartResponse: response));
        });
  }

  void updateCartCount(int count, String productId) async {
    emit(UpdateCountInCartLoadingStates());
    var either = await Api_maneger.getCart();
    either.fold((l) => emit(UpdateCountInCartErrorStates(failures: l)),
            (response) {
          productList = response.data!.products ?? [];
          emit(UpdateCountInCartSuccessStates(getCartResponse: response));
        });
  }
}