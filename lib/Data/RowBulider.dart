import 'package:e_commerce/Data/Text_Theme.dart';
import 'package:e_commerce/Data/appColor.dart';
import 'package:flutter/material.dart';

class Rowsbuilder extends StatelessWidget {

  String text;
  Rowsbuilder({required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(text,style: TextThemes.bodymidBlack.copyWith(color: AppColor.primarycolor),),Text("view all",style: TextThemes.bodymidBlack.copyWith(color: AppColor.primarycolor))],
    );
  }
}
