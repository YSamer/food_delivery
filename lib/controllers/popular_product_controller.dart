import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/data/api/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  // late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  // int _quantity = 0;
  // int get quantity => _quantity;

  // int _inCartItems = 0;
  // int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    var response = await popularProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList
          .addAll(Product.fromJson(json.decode(response.body)).products);
      _isLoaded = true;
      update();
    } else {}
  }

  // void setQuantity(bool isIncrement) {
  //   if (isIncrement) {
  //     checkQuantity(++_quantity);
  //   } else {
  //     checkQuantity(--_quantity);
  //   }
  //   update();
  // }

  // checkQuantity(int quantity) {
  //   if ((_inCartItems + quantity) < 0) {
  //     Get.snackbar(
  //       'Item Count',
  //       'You Can\'t reduce more !',
  //       backgroundColor: mainColor,
  //       colorText: Colors.white,
  //     );
  //     // if (_inCartItems > 0) {
  //       _quantity = -_inCartItems;
  //     //   return quantity;
  //     // }
  //     // quantity = 0;
  //   } else if ((_inCartItems + quantity) > 20) {
  //     Get.snackbar(
  //       'Item Count',
  //       'You Can\'t add more !',
  //       backgroundColor: mainColor,
  //       colorText: Colors.white,
  //     );
  //     _quantity = 20 - _inCartItems;
  //   } else {
  //     // quantity = quantity;
  //   }
  //   update();
  // }

  // void initProduct(ProductModel product, CartController cart) {
  //   _quantity = 0;
  //   _inCartItems = 0;
  //   _cart = cart;
  //   var exist = false;
  //   exist = _cart.existInCart(product);

  //   if (exist) {
  //     _inCartItems = _cart.getQuantity(product);
  //   }
  // }

  // void addItem(ProductModel product) {
  //   _cart.addItem(product, _quantity);
  //   _quantity = 0;
  //   _inCartItems = _cart.getQuantity(product);

  //   update();
  // }

  // int get totalItems {
  //   return _cart.totalItems;
  // }

  // List<CartModel> get getItems {
  //   return _cart.getItems;
  // }
}
