import 'package:e_commerce/Api/model/ProductPage/ProductBulder.dart';
import 'package:e_commerce/Api/model/ProductPage/Product_Cubit.dart';
import 'package:e_commerce/Api/model/ProductPage/Product_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  static const String routname = 'cart';
  var productCubit = ProductCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<ProductCubit, ProductStates>(
            bloc: productCubit..getAllproduct(),
            builder: (context, state) {
              return state is ProductLoadingStates
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Productbuilder(
                products: productCubit.Product,
              );
            }),
      ),
    );
  }
}
