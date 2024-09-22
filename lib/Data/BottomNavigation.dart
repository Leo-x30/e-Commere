import 'package:e_commerce/Data/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CustombottomBar({
  required int selectedIndex,
  required Function(int) onTapFunc,
  required BuildContext context,
}) {
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
          icon: CircleAvatar(
            foregroundColor: selectedIndex == 0
                ? AppColor.primarycolor
                : AppColor.whitecolor,
            backgroundColor: selectedIndex == 0
                ? AppColor.whitecolor
                : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              AssetImage('assets/homepage.png'), // Image icon from first file
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor: selectedIndex == 1
                ? AppColor.primarycolor
                : AppColor.whitecolor,
            backgroundColor: selectedIndex == 1
                ? AppColor.whitecolor
                : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              AssetImage('assets/categories.png'), // Image icon from first file
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor: selectedIndex == 2
                ? AppColor.primarycolor
                : AppColor.whitecolor,
            backgroundColor: selectedIndex == 2
                ? AppColor.whitecolor
                : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              AssetImage('assets/favorites.png'), // Image icon from first file
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor: selectedIndex == 3
                ? AppColor.primarycolor
                : AppColor.whitecolor,
            backgroundColor: selectedIndex == 3
                ? AppColor.whitecolor
                : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              AssetImage('assets/profile.png'), // Image icon from first file
            ),
          ),
          label: '',
        ),
      ],
    ),
  );
}
