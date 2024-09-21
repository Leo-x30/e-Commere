import 'package:e_commerce/Api/model/Home/categoryOrBrand_response.dart';
import 'package:e_commerce/Data/CategoryOrBrandItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsAndCategory extends StatelessWidget {
  List<Data> categories;
  BrandsAndCategory({required this.categories});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      child: GridView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryAndbranditem(list: categories[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20.h),
      ),
    );
  }
}
