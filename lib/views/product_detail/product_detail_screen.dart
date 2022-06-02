import 'package:dro_home_task/constants.dart';
import 'package:dro_home_task/views/cart/cart_screen.dart';
import 'package:dro_home_task/views/pharmacy_search/pharamcy_search_screen.dart';
import 'package:dro_home_task/widgets/dro_button.dart';
import 'package:dro_home_task/widgets/dro_button_outline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../data/products.dart';
import '../../db_helper/db_helper.dart';
import '../../model/cart.dart';
import '../../repository/cart_provider.dart';
import '../../widgets/appbar.dart';
import '../../widgets/product_card.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen(
      {Key? key,
      required this.productImage,
      required this.productType,
      required this.productMeasurement,
      required this.productSeller,
      required this.productSellerImage,
      required this.productPackSize,
      required this.productID,
      required this.productConstituent,
      required this.productDispensedIn,
      required this.productDescription,
      required this.productPrice,
      required this.productName,
      required this.index,
      required this.initialPrice})
      : super(key: key);

  final int index;
  final String productImage;
  final String productName;
  final int productPrice;
  final int initialPrice;
  final String productType;
  final String productMeasurement;
  final String productSeller;
  final String productSellerImage;
  final String productPackSize;
  final String productID;
  final String productConstituent;
  final String productDispensedIn;
  final String productDescription;

  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  int counter = 1;
  bool isLikeSelected = false;

  DBHelper? dbHelper = DBHelper();

  void addCart(var cart, int index) {
    dbHelper!
        .insert(Cart(
      id: index,
      productId: index.toString(),
      productName: widget.productName,
      productImage: widget.productImage,
      productType: widget.productType,
      productMeasurement: widget.productMeasurement,
      productPrice: widget.productPrice * counter,
      quantity: counter,
      initialPrice: widget.initialPrice,
    ))
        .then((value) {
      var newValue = widget.productPrice * (counter);
      cart.addTotalPrice(double.parse(newValue.toString()));
      cart.addCounter();
      cartModal();

      // const snackBar = SnackBar(
      //   backgroundColor: Colors.green,
      //   content: Text('Product is added to cart'),
      //   duration: Duration(seconds: 1),
      // );
      //
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).onError((error, stackTrace) {
      //print("error$error");
      const snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text('Product is already added in cart'),
          duration: Duration(seconds: 1));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void cartModal() {
    showMaterialModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultPadding),
        ),
      ),
      builder: (context) => SizedBox(
        height: 300,
        child: Column(
          children: [
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text("${widget.productName} has been successfully added to cart!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                fontSize: 20.0,fontWeight: FontWeight.w400
              ),),
            ),
            const SizedBox(height: defaultPadding * 3.0),
            DROButton(
              isCartIconShown: false,
              text: "VIEW CART",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CartScreen()));
              },
            ),
            const SizedBox(height: defaultPadding),
            DROButtonOutline(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  const PharmacySearchScreen(searchText: '',)));
            }, text: "CONTINUE SHOPPING")
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarWidget(
          appBarTitle: "Pharmacy",
          icon: "assets/icons/cart.svg",
          isLeadingIconActivated: true,
          isSearchBarActivated: false,
          isCartScreen: false,
          isPharmacySearchScreen: false,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding * 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding / 2.0),
              Center(
                child: SizedBox(
                  height: 150,
                  width: 170,
                  child: Image.asset(
                    widget.productImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              Center(
                child: Text(
                  widget.productName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: defaultPadding / 4.0),
              Center(
                child: Text(
                  "${widget.productType} - ${widget.productMeasurement}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: defaultPadding * 2.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: droProductTextColor.withOpacity(0.2),
                        ),
                        image: DecorationImage(
                            image: AssetImage(widget.productSellerImage),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultPadding / 4.0),
                  Expanded(
                    flex: 4,
                    child: RichText(
                      text: TextSpan(
                        text: 'SOLD BY\n',
                        style: const TextStyle(
                            color: Color(0xff8EA5BC),
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.productSeller,
                            style: const TextStyle(
                                color: Color(0xff13447A),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLikeSelected = !isLikeSelected;
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        margin: const EdgeInsets.only(
                            right: defaultPadding / 2.0,
                            left: defaultPadding / 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                              BorderRadius.circular(defaultPadding / 2.0),
                          color: const Color(0xff9F5DE2).withOpacity(0.1),
                        ),
                        child: isLikeSelected == false
                            ? const Icon(CupertinoIcons.heart,
                                color: droPurple, size: 24)
                            : const Icon(CupertinoIcons.heart_fill,
                                color: droPurple, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2.0),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.circular(defaultPadding - 6.0),
                        border: Border.all(color: const Color(0xffc4c4c4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding / 2.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (counter > 1) {
                                    counter--;
                                  }
                                });
                              },
                              child: const Icon(CupertinoIcons.minus),
                            ),
                          ),
                          Text(
                            "$counter",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding / 2.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "   Packs(s)",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400),
                        children: [
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(0.0, -18.0),
                              child: const Text(
                                '₦ ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "${(counter) * widget.productPrice}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32.0,
                                fontWeight: FontWeight.w700),
                          ),
                          const TextSpan(
                            text: '.00',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2.0),
              const Text(
                "PRODUCT DETAILS",
                style: TextStyle(
                    color: Color(0xff8EA5BC),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset("assets/icons/packsize.svg",
                            width: 30.0, height: 30.0),
                      ),
                      Expanded(
                        flex: 3,
                        child: RichText(
                          text: TextSpan(
                            text: 'PACK SIZE\n',
                            style: const TextStyle(
                                color: Color(0xff8EA5BC),
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.productPackSize,
                                style: const TextStyle(
                                    color: Color(0xff13447A),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          "assets/icons/productid.svg",
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: RichText(
                          text: TextSpan(
                            text: 'PRODUCT ID\n',
                            style: const TextStyle(
                                color: Color(0xff8EA5BC),
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.productID,
                                style: const TextStyle(
                                    color: Color(0xff13447A),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset("assets/icons/constituent.svg",
                            width: 30.0, height: 30.0),
                      ),
                      Expanded(
                        flex: 3,
                        child: RichText(
                          text: TextSpan(
                            text: 'CONSTITUENTS\n',
                            style: const TextStyle(
                                color: Color(0xff8EA5BC),
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.productConstituent,
                                style: const TextStyle(
                                    color: Color(0xff13447A),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          "assets/icons/dispense.svg",
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: RichText(
                          text: TextSpan(
                            text: 'DISPENSED IN\n',
                            style: const TextStyle(
                                color: Color(0xff8EA5BC),
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.productDispensedIn,
                                style: const TextStyle(
                                    color: Color(0xff13447A),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: defaultPadding * 2.0),
              Text(
                widget.productDescription,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0),
              ),
              const SizedBox(height: defaultPadding * 2.0),
              const Text(
                "Similar Products",
                style: TextStyle(
                    color: droProductTextColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                height: 200,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: (productList.length > 5 ? 5 : productList.length),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      products: productList[index],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100.0,
        color: droWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DROButton(
              isCartIconShown: true,
              onPressed: () {
                addCart(cart, widget.index);
              },
              text: "Add to Cart",
            ),
          ],
        ),
      ),
    );
  }
}
