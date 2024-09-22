import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Api/EndPoints.dart';
import 'package:e_commerce/Api/errors.dart';
import 'package:e_commerce/Api/model/Cart/AddToCart.dart';
import 'package:e_commerce/Api/model/Cart/CartResponse.dart';
import 'package:e_commerce/Api/model/Home/categoryOrBrand_response.dart';
import 'package:e_commerce/Api/model/Login/login_request.dart';
import 'package:e_commerce/Api/model/Login/login_response.dart';
import 'package:e_commerce/Api/model/Register/register_response.dart';
import 'package:e_commerce/Api/model/ProductPage/product_responce.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'ecommerce.routemisr.com';

class Api_maneger {
  static Future<RegisterResponse> Register(
      String name,
      String email,
      String password,
      String rePassword,
      String Phone,
      ) async {
    try {
      Uri url = Uri.https(baseUrl, Endpoints.signup);
      var response = await http.post(url, body: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": Phone
      });
      return RegisterResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<LoginResponse> Login(
      String email,
      String password,
      ) async {
    try {
      Uri url = Uri.https(baseUrl, Endpoints.logIn);

      LoginRequest request = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: request.toJson());
      return LoginResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryrOrBrandResponse> GetAllCategories() async {
    try {
      Uri url = Uri.https(baseUrl, Endpoints.category);
      var response = await http.get(url);
      return CategoryrOrBrandResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryrOrBrandResponse> GetAllBrands() async {
    try {
      Uri url = Uri.https(baseUrl, Endpoints.Brand);
      var response = await http.get(url);
      return CategoryrOrBrandResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductResponce> GetAllProduct() async {
    try {
      Uri url = Uri.https(baseUrl, Endpoints.product);
      var response = await http.get(url);
      return ProductResponce.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
  static Future<Either<Failures, AddToCartResponse>> addCartData(
      String productId) async {
    Uri url = Uri.https(baseUrl, Endpoints.addToCart);

    try {
      var response = await http.post(url,
          body: {'productId': productId});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addToCartResponse = AddToCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } catch (e) {
      return Left(NetworkError(errorMessage: "No Internet Connection"));
    }
  }

  static Future<Either<Failures, GetCartResponse>> getCart() async {
    Uri url = Uri.https(baseUrl, Endpoints.addToCart);

    try {
      var response = await http.get(url,);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getCartResponse = GetCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      }
    } catch (e) {
      return Left(NetworkError(errorMessage: 'error'));
    }
  }
}