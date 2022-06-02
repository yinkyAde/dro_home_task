import 'package:dro_home_task/constants.dart';
import 'package:dro_home_task/data/products.dart';
import 'package:dro_home_task/views/cart/cart_screen.dart';
import 'package:dro_home_task/widgets/appbar.dart';
import 'package:dro_home_task/widgets/floating_button.dart';
import 'package:dro_home_task/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../data/categories.dart';
import '../../repository/cart_provider.dart';
import '../../widgets/category_card.dart';
import '../categories/categories_screen.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  PharmacyScreenState createState() => PharmacyScreenState();
}

class PharmacyScreenState extends State<PharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBarWidget(
          appBarTitle: "Pharmacy",
          icon: "assets/icons/van.svg",
          isLeadingIconActivated: false,
          isSearchBarActivated: true,
          isCartScreen: false,
          isPharmacySearchScreen: false,
          onPressed: (){},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              color: droGray,
              child: Row(
                children: [
                  const SizedBox(width: defaultPadding * 2.0),
                  SvgPicture.asset("assets/icons/location.svg"),
                  const SizedBox(width: defaultPadding / 2.0),
                  RichText(
                    text: const TextSpan(
                      text: 'Delivery in ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Lagos, NG',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding * 2.0,
                right: defaultPadding * 2.0,
                top: defaultPadding,
                bottom: defaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text(
                    "CATEGORIES",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CategoriesScreen()));
                    },
                    child: const Text(
                      "VIEW ALL",
                      style: TextStyle(
                          color: droPurple,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding * 2.0,
                bottom: defaultPadding,
              ),
              child: SizedBox(
                height: 110,
                child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryCard(
                        width: 175.0,
                        height: 125.0,
                        category: demoCategories[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(indent: defaultPadding / 4.0),
                    itemCount: demoCategories.length),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding * 2.0,
                right: defaultPadding * 2.0,
                top: defaultPadding,
                bottom: defaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "SUGGESTIONS",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                  // Text(
                  //   "VIEW ALL",
                  //   style: TextStyle(
                  //       color: droPurple,
                  //       fontSize: 14.0,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ],
              ),
            ),
            SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  left: defaultPadding * 1.5,
                  right: defaultPadding * 1.5,
                  top: defaultPadding,
                  bottom: defaultPadding * 4.5,
                ),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .75,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductCard(products: productList[index],index: index,);
                },
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingButtonWidget(
        totalCart: cart.getCounter().toString(),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CartScreen()));
        },
      ),
    );
  }
}
