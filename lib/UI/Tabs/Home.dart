import 'package:e_commerce/Api/model/Home/HomeStates.dart';
import 'package:e_commerce/Api/model/Home/Home_Cubit.dart';
import 'package:e_commerce/Data/BrandsAndCategory.dart';
import 'package:e_commerce/Data/RowBulider.dart';
import 'package:e_commerce/Data/appColor.dart';
import 'package:e_commerce/UI/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Home extends StatelessWidget {
  var homeCubit = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      bloc: homeCubit
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/Group 5.png",
                    color: AppColor.primarycolor,
                    width: 90.w,
                    height: 90.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 350.w,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "What do you search for?",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(child: Icon(Icons.shopping_cart, color: Colors.blue),
                      onTap: (){
                        Navigator.of(context).pushNamed(Cart.routname);
                      },),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: ImageSlideshow(
                      /// Width of the [ImageSlideshow].
                      width: double.infinity,

                      /// Height of the [ImageSlideshow].
                      height: 200.h,

                      /// The page to show when first creating the [ImageSlideshow].
                      initialPage: 0,

                      /// The color to paint the indicator.
                      indicatorColor: AppColor.primarycolor,

                      /// The color to paint behind th indicator.
                      indicatorBackgroundColor: Colors.grey,

                      /// The widgets to display in the [ImageSlideshow].
                      /// Add the sample image file into the images folder
                      children: [
                        Image.asset(
                          'assets/sale1.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/sale2.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/sale3.png',
                          fit: BoxFit.cover,
                        ),
                      ],

                      /// Called whenever the page in the center of the viewport changes.
                      onPageChanged: (value) {
                        print('Page changed: $value');
                      },

                      /// Auto scroll interval.
                      /// Do not auto scroll with null or 0.
                      autoPlayInterval: 3000,

                      /// Loops back to first slide.
                      isLoop: true,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Rowsbuilder(text: "Categories"),
                  SizedBox(
                    height: 15.h,
                  ),

                  state is HomeCategoryLoadingStates
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : BrandsAndCategory(
                          categories: homeCubit.categories,
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Rowsbuilder(text: "Brands"),
                  SizedBox(
                    height: 15.h,
                  ),
                  state is HomeCategoryLoadingStates
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : BrandsAndCategory(
                          categories: homeCubit.Brands,
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
