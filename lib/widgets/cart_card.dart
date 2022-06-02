import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../db_helper/db_helper.dart';
import '../model/cart.dart';
import '../repository/cart_provider.dart';

class CartCard extends StatefulWidget {
   const CartCard(
      {Key? key,
      required this.productName,
      required this.productType,
      required this.productMeasurement,
      required this.productPrice,
      required this.quantity,
      required this.onPressed,
      required this.productImage,
      required this.index,
      required this.initialPrice})
      : super(key: key);

  final String productName;
  final String productImage;
  final String productType;
  final String productMeasurement;
  final int productPrice;
  final int initialPrice;
  final String quantity;
  final int index;
  final VoidCallback onPressed;

  @override
  CartCardState createState() => CartCardState();
}

class CartCardState extends State<CartCard> {

  DBHelper? dbHelper = DBHelper();

  var cartQuantity = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];
  String selectedQuantity = "1" ;
  var selectedValue;

  updateCart(var cart){

    dbHelper!.updateQuantity(
        Cart(
          id: widget.index,
          productId: widget.index.toString(),
          productName: widget.productName,
          productImage: widget.productImage,
          productType : widget.productType,
          productMeasurement : widget.productMeasurement,
          productPrice: widget.initialPrice * int.parse(selectedQuantity),
          quantity:  int.parse(selectedQuantity),
          initialPrice: widget.initialPrice,

        )).then((value){
      var newValue = widget.initialPrice * (int.parse(selectedQuantity));
      cart.addTotalPrice(double.parse(newValue.toString()));
    }).onError((error, stackTrace){
      //print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    selectedValue = widget.quantity;
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding,right: defaultPadding),
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultPadding - 6.0),
        // boxShadow: const [
        //   BoxShadow(
        //     offset: Offset(0, 18),
        //     blurRadius: 23,
        //     spreadRadius: -13,
        //     color: shadow,
        //   ),
        // ],
      ),
      child: Column(
        children: [
          //const SizedBox(height: defaultPadding),
          Row(
            children: [
              const SizedBox(width: defaultPadding / 4.0),
              Expanded(
                flex: 1,
                child: Image.asset(
                  widget.productImage,
                  width: 80.0,
                  height: 80.0,
                ),
              ),
              const SizedBox(width: defaultPadding - 6.0),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: defaultPadding/4.0, left: defaultPadding / 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: defaultPadding / 4.0),
                      Text(
                        widget.productName,
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: droProductTextColor),
                      ),
                      const SizedBox(height: defaultPadding / 8.0),
                      Text(
                        "${widget.productType}・${widget.productMeasurement}",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: droProductTextColor.withOpacity(0.6)),
                      ),
                      const SizedBox(height: defaultPadding / 2.0),
                      Text(
                        "₦${widget.productPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: droProductTextColor),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: defaultPadding, right: defaultPadding / 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 40,
                        padding: const EdgeInsets.only(
                            left: 20, right: 16, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffc4c4c4),
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          icon: const Icon(
                            CupertinoIcons.chevron_down,
                            color: droPurple,
                            size: 16,
                          ),
                          iconSize: 22,
                          isExpanded: true,
                          underline: const SizedBox(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          value: selectedValue,
                          onChanged: (newValue) {
                            setState(() {
                              selectedQuantity = newValue.toString();
                              selectedValue = newValue;
                              // print(selectedQuantity);
                              // print(selectedValue);
                              updateCart(cart);
                            });
                          },
                          items: cartQuantity
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: defaultPadding, right: defaultPadding / 2.0),
                        child: GestureDetector(
                          onTap: () {
                            widget.onPressed();
                          },
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.delete,
                                      size: 20,
                                      color: droPurple,
                                    ),
                                    alignment: PlaceholderAlignment.middle),
                                TextSpan(
                                    text: " Remove",
                                    style: TextStyle(
                                        color: droPurple,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding/8.0),
          const Divider(
            color: Color(0xffc4c4c4),
          ),
          //const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
