import 'package:dro_home_task/data/products.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../views/product_detail/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Products products;
  final int index;

  const ProductCard({Key? key, required this.products, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultPadding - 6.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 18),
            blurRadius: 23,
            spreadRadius: -13,
            color: shadow,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                      index: index,
                      productPackSize: products.productDetails[index].productPackSize,
                      productDescription:  products.productDetails[index].productDescription,
                      productType: products.productType,
                      productConstituent: products.productDetails[index].productConstituent,
                      productMeasurement:  products.productMeasurement,
                      productID:  products.productDetails[index].productID,
                      productDispensedIn:  products.productDetails[index].productDispensedIn,
                      productSeller:  products.productDetails[index].productSeller,
                      productImage:  products.productImage,
                      productSellerImage:  products.productDetails[index].productSellerImage,
                      productName: products.productName,
                      productPrice: products.productPrice,
                      initialPrice: products.initialPrice,
                    )));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    products.productImage,
                    width: MediaQuery.of(context).size.width,
                  ),
                  products.requiresPrescription == true
                      ? Positioned(
                          bottom: 0,
                          child: Container(
                            height: 20,
                            padding: const EdgeInsets.only(left: defaultPadding * 1.3, top: defaultPadding / 4.0),
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black.withOpacity(0.5),
                            child: const Text(
                              "Requires a prescription",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: droWhite),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding / 2.0,
                  top: defaultPadding / 2.0,
                ),
                child: Text(
                  products.productName,
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: droProductTextColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding / 2.0,
                  top: defaultPadding / 8.0,
                ),
                child: Text(
                  "${products.productType}・${products.productMeasurement}",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: droProductTextColor.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: defaultPadding / 2.0, top: defaultPadding),
                child: Text(
                  "₦${products.productPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: droProductTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
