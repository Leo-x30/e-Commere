import 'package:e_commerce/Data/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CustombottomBar({required int selectedIndex, required Function(int) onTapFunc, required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.primarycolor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTapFunc,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == 0 ? AppColor.whitecolor : Colors.transparent,
            ),
            child: Icon(
              Icons.home_outlined,
              size: 35.sp,
              color: selectedIndex == 0 ? AppColor.primarycolor : AppColor.whitecolor,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == 1 ? AppColor.whitecolor : Colors.transparent,
            ),
            child: Icon(
              Icons.category_outlined,
              size: 35.sp,
              color: selectedIndex == 1 ? AppColor.primarycolor : AppColor.whitecolor,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == 2 ? AppColor.whitecolor : Colors.transparent,
            ),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 35.sp,
              color: selectedIndex == 2 ? AppColor.primarycolor : AppColor.whitecolor,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == 3 ? AppColor.whitecolor : Colors.transparent,
            ),
            child: Icon(
              Icons.person_outline,
              size: 35.sp,
              color: selectedIndex == 3 ? AppColor.primarycolor : AppColor.whitecolor,
            ),
          ),
          label: '',
        ),
      ],
    ),
  );
}
