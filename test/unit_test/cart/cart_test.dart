import 'dart:math';

import 'package:dro_home_task/model/cart.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('shopping cart', () {
    group('constructor', () {
      test(
          'should return productPrice 0 and quantity 0  if shopping cart is created using constructor with empty values',
          () {
        final shoppingCart = Cart(
            id: 0,
            productName: ' ',
            initialPrice: 0,
            productType: ' ',
            quantity: 0,
            productId: ' ',
            productMeasurement: ' ',
            productPrice: 0,
            productImage: ' ');
        
        expect(shoppingCart.productPrice, 0);
        expect(shoppingCart.quantity, 0);
      });

      // test(
      //     'should return productPrice equal to item price and item if shopping cart is created using constructor with 1 item',
      //     () {
      //   final items = givenAShoppingCartItem(1, 350.0);
      //   final shoppingCart = Cart(
      //       id: 0,
      //       productName: 'Pracetamol',
      //       initialPrice: 350.0.toInt(),
      //       productType: 'tablet',
      //       quantity: 1,
      //       productId: '0',
      //       productMeasurement: '500mg',
      //       productPrice:  350.0.toInt(),
      //       productImage: 'Dummy Image');
      //
      //   expect(shoppingCart, items);
      //   expect(shoppingCart.productPrice, 350.0);
      //   expect(shoppingCart.quantity, 1);
      // });

    });

    // group('createEmpty', () {
    //   test(
    //       'should return totalPrice 0 and empty items if shopping cart is created using create empty',
    //       () {
    //         final items = givenAShoppingCartItem(0, 0.0);
    //     final shoppingCart = Cart(id: 0,
    //         productName: ' ',
    //         initialPrice: 0.0.toInt(),
    //         productType: ' ',
    //         quantity: 0.0.toInt(),
    //         productId: '0',
    //         productMeasurement: ' ',
    //         productPrice:  0.0.toInt(),
    //         productImage: ' ');
    //
    //     expect(shoppingCart, items);
    //     expect(shoppingCart.productPrice, 0);
    //     expect(shoppingCart.quantity, 0);
    //   });
    // });

  });
}

Cart givenAShoppingCartItem([int quantity = 1, double productPrice = 0]) {
  final Random random = Random();
  final int randomNumber = random.nextInt(100);

  return Cart(
      id: randomNumber,
      productName: 'Dummy Product Name',
      initialPrice: 350.0.toInt(),
      productType: 'Tablet',
      quantity: quantity,
      productId: randomNumber.toString(),
      productMeasurement: '500mg',
      productPrice: productPrice.toInt(),
      productImage: 'Dummy Image');
}
