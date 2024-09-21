import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Api/model/ProductPage/product_responce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  Data product;
  ProductCard({required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          product.imageCover ??
                              "", // Replace with the actual image URL
                          fit: BoxFit.cover,
                          height: 150.h,
                          width: double.infinity,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                product.title ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "EGP ${product.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "${product.ratingsAverage}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    " (Review)",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: FloatingActionButton(
              //     onPressed: () {},
              //     mini: true,
              //     child: Icon(Icons.add),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}