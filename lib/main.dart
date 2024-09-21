import 'package:e_commerce/Data/SharedPreference_pacakge.dart';
import 'package:e_commerce/UI/Home_Screen.dart';
import 'package:e_commerce/UI/Login_Screen.dart';
import 'package:e_commerce/UI/SignUp_Screen.dart';
import 'package:e_commerce/UI/ProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  String route;
  WidgetsFlutterBinding.ensureInitialized();
  await SharedpreferenceUtils.init();
  var token = await SharedpreferenceUtils.getData(key: "token");
  if (token == null) {
    route = LoginScreen.routName;
  } else {
    route = HomeScreen.routName;
  }

  runApp(MyApp(
    route: route,
  ));
}

class MyApp extends StatelessWidget {
  String route;
  MyApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            routes: {
              SignUpScreen.routName: (context) => SignUpScreen(),
              LoginScreen.routName: (context) => LoginScreen(),
              HomeScreen.routName: (context) => HomeScreen(),
              ProductDetailsPage.roteName: (context) => ProductDetailsPage(),
            },
          );
        });
  }
}
