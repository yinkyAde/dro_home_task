import 'package:dro_home_task/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../db_helper/db_helper.dart';
import '../../model/cart.dart';
import '../../repository/cart_provider.dart';
import '../../widgets/appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();

  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarWidget(
          appBarTitle: "Cart",
          icon: "assets/icons/cart.svg",
          isLeadingIconActivated: true,
          isSearchBarActivated: false,
          isCartScreen: true,
          isPharmacySearchScreen: false,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           const SizedBox(height: defaultPadding),
            FutureBuilder(
                future: cart.getData(),
                builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                  //print(snapshot.error.toString());
                  if (snapshot.data == null) {
                    return Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: const [
                            SizedBox(height: defaultPadding * 8.0),
                            Text(
                              "Your cart is empty!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20.0),
                            ),
                          ],
                        ));
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CartCard(
                              quantity: snapshot.data![index].quantity.toString(),
                              productPrice: snapshot.data![index].productPrice,
                              initialPrice: snapshot.data![index].initialPrice ,
                              productType: snapshot.data![index].productType.toString(),
                              onPressed: () {
                                dbHelper!.delete(snapshot.data![index].id);
                                cart.removerCounter();
                                var newValue = snapshot.data![index].productPrice * snapshot.data![index].quantity;
                                cart.removeTotalPrice(double.parse(newValue.toString()));
                              },
                              productName: snapshot.data![index].productName.toString(),
                              productMeasurement: snapshot.data![index].productMeasurement.toString(),
                              productImage: snapshot.data![index].productImage.toString(),
                              index: index,
                            );
                          }),
                    );
                  }
                }),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: droWhite,
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text:  TextSpan(
                  text: 'Total: ',
                  style: const TextStyle(
                      color: droProductTextColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: "₦${cart.getTotalPrice().toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: droProductTextColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50.0,
                width: 364,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPadding - 6.0),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [droPurpleGradientLeft, droPurpleGradientRight],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: const Center(
                      child: Text(
                        "CHECKOUT",
                        style: TextStyle(
                            color: droWhite,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
