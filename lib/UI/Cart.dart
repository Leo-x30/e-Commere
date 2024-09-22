import 'package:e_commerce/Api/model/Cart/Cart_states.dart';
import 'package:e_commerce/Api/model/Cart/cart%20viewModel.dart';
import 'package:e_commerce/Data/Cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartscreen extends StatelessWidget {
  static const String routename = 'cart';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Cartviewmodel()..getCart(),
      child: BlocBuilder<Cartviewmodel, CartStates>(
        builder: (context, state) {
          if (state is GetCartSuccessStates) {
            return Scaffold(
              bottomNavigationBar: Container(
                height: 70.h,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                        Text(
                          "EGP  ${state.getCartResponse.data!.totalCartPrice}",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        // Handle checkout logic
                      },
                      child: Text(
                        "Check Out",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CartItem(
                          productCart: state.getCartResponse.data!
                              .products![index],
                        );
                      },
                      itemCount: state.getCartResponse.data!.products!
                          .length,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}