import 'package:dro_home_task/data/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../views/product_detail/product_detail_screen.dart';



class ProductCardWithAddCart extends StatelessWidget {

  final Products products;
  final bool isLikeSelected;
  final VoidCallback onLikePressed;
  final VoidCallback onAddCartPressed;
  final int index;
  const ProductCardWithAddCart({Key? key, required this.products, required this.isLikeSelected, required this.onLikePressed, required this.onAddCartPressed, required this.index}) : super(key: key);


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
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  ProductDetailScreen(
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
              Image.asset(products.productImage,width: MediaQuery.of(context).size.width,),
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
                    left: defaultPadding / 2.0, top: defaultPadding/ 2.0),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child: Text(
                        "₦${products.productPrice}.00",
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: droProductTextColor),
                    ),),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          onLikePressed();
                        },
                        child: Container(
                          width: 30,
                          height: 40,
                          margin:const EdgeInsets.only(right: defaultPadding/2.0, left: defaultPadding/2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(defaultPadding / 2.0),
                            color: const Color(0xff9F5DE2).withOpacity(0.1),
                          ),
                          child: isLikeSelected == false ?  const Icon(CupertinoIcons.heart,color: droPurple, size: 24) : const Icon(CupertinoIcons.heart_fill,color: droPurple, size: 24) ,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: defaultPadding / 2.0,
                    top: defaultPadding ,
                    right: defaultPadding),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: droPurple),
                    borderRadius: BorderRadius.circular(defaultPadding - 6.0),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){
                        onAddCartPressed();
                      },
                      child: const Center(
                        child: Text(
                          "ADD TO CART",
                          style: TextStyle(
                            color: droPurple,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
