import 'package:e_commerce/Data/Text_Theme.dart';
import 'package:e_commerce/Data/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../Api/model/ProductPage/product_responce.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String roteName = "ProductDetailsPage";

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments as Data);

    final product = arguments;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Container(
                  width: 300.w,
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
                Icon(Icons.shopping_cart, color: Colors.blueAccent),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: ImageSlideshow(
                /// Width of the [ImageSlideshow].
                width: double.infinity,

                /// Height of the [ImageSlideshow].
                height: 300.h,

                /// The page to show when first creating the [ImageSlideshow].
                initialPage: 0,

                /// The color to paint the indicator.
                indicatorColor: AppColor.primarycolor,

                /// The color to paint behind th indicator.
                indicatorBackgroundColor: Colors.grey,

                /// The widgets to display in the [ImageSlideshow].
                /// Add the sample image file into the images folder
                children: [
                  Image.network(
                    product.images![0] ?? '',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    product.images![1] ?? '',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    product.images![1] ?? '',
                    fit: BoxFit.cover,
                  ),
                ],
                /// Called whenever the page in the center of the viewport changes.

                /// Auto scroll interval.
                /// Do not auto scroll with null or 0.
                autoPlayInterval: 3000,

                /// Loops back to first slide.
                isLoop: true,
              ),
            ),
            SizedBox(height: 16),
            // Product Name
            Text(
              product.title ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Rating and Sold Count
            Row(
              children: [
                Text('Sold ${product.sold}', style: TextStyle(fontSize: 16)),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 20),
                    SizedBox(width: 4),
                    Text(product.ratingsAverage.toString() ?? '',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Description',
              style:
              TextThemes.bodymidBlack.copyWith(fontWeight: FontWeight.bold),
            ),
            // Product Description
            ReadMoreText(
              product.description ?? '',
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Size Selector

            SizedBox(height: 16),
            // Color Selector

            SizedBox(height: 16),
            // Total Price and Add to Cart
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'EGP ${product.price ?? ''}',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 25.w,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle add to cart
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      backgroundColor: AppColor.primarycolor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.shopify,
                          size: 25,
                          color: AppColor.whitecolor,
                        ),
                        Text('Add to cart', style: TextThemes.bodymidWhite),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}