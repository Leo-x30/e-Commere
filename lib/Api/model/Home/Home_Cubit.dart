import 'package:e_commerce/Api/Api_manager.dart';
import 'package:e_commerce/Api/model/Home/HomeBrand.dart';
import 'package:e_commerce/Api/model/Home/HomeStates.dart';
import 'package:e_commerce/Api/model/Home/categoryOrBrand_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeCategoryIntialStates());
  List<Data> categories = [];
  List<Data> Brands = [];

  void getAllCategories() async {
    try {
      emit(HomeCategoryLoadingStates());
      var response = await Api_maneger.GetAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HomeCategoryErrorStates(errorMessage: response.message!));
      } else {
        categories = response.data ?? [];
        emit(HomeCategorySuccessStates(response: response));
      }
    } catch (e) {
      emit(HomeBrandErrorStates(errorMessage: e.toString()));
    }
  }

  void getAllBrands() async {
    try {
      emit(HomeBrandLoadingStates());
      var response = await Api_maneger.GetAllBrands();
      if (response.statusMsg == 'fail') {
        emit(HomeBrandErrorStates(errorMessage: response.message!));
      } else {
        Brands = response.data ?? [];
        emit(HomeBrandSuccessStates(response: response));
      }
    } catch (e) {
      emit(HomeBrandErrorStates(errorMessage: e.toString()));
    }
  }
}
