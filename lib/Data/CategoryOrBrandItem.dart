import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Api/model/Home/categoryOrBrand_response.dart';
import 'package:e_commerce/Data/Text_Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryAndbranditem extends StatelessWidget {
  Data list;
  CategoryAndbranditem({required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            imageUrl: list.image ?? "",
            imageBuilder: (context, imageProvider) => Container(
              width: 100.r,
              height: 100.r,
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(1000.r),
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
              ),
            ),
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          // Image.network(list.image??""),
        ),
        SizedBox(
          height: 15.h,
        ),
        Expanded(
            flex: 3,
            child: Center(
              child: Text(list.name ?? "",
                  style: TextThemes.bodymidBlack
                      .copyWith(color: const Color.fromARGB(255, 0, 45, 90), fontSize: 18)),
            ))
      ],
    );
  }
}
