import 'package:e_commerce/UI/Cart.dart';
import 'package:e_commerce/UI/Home_Screen.dart';
import 'package:e_commerce/UI/Login_Screen.dart';
import 'package:e_commerce/UI/SignUp_Screen.dart';
import 'package:e_commerce/UI/ProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: LoginScreen.routName,
            routes: {
              SignUpScreen.routName: (context) => SignUpScreen(),
              LoginScreen.routName: (context) => LoginScreen(),
              HomeScreen.routName: (context) => HomeScreen(),
              ProductDetailsPage.routeName: (context) => ProductDetailsPage(),
              Cartscreen.routename: (context) => Cartscreen()
            },
          );
        });
  }
}
