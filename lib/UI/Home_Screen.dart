import 'package:e_commerce/Data/BottomNavigation.dart';
import 'package:e_commerce/UI/Tabs/Category.dart';
import 'package:e_commerce/UI/Tabs/Favourites.dart';
import 'package:e_commerce/UI/Tabs/Home.dart';
import 'package:e_commerce/UI/Tabs/ProfilePage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "Home_Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> taps = [
    Home(),
    Category(),
    Favourites(),
    Profilepage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[selectedIndex],
      bottomNavigationBar: CustombottomBar(
          selectedIndex: selectedIndex,
          onTapFunc: (index) {
            selectedIndex = index;
            setState(() {});
          },
          context: context),
    );
  }
}
