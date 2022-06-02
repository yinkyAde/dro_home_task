import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/categories.dart';
import '../../data/products.dart';
import '../../widgets/appbar.dart';
import '../../widgets/category_card.dart';
import '../../widgets/product_card.dart';
import '../cart/cart_screen.dart';
import '../categories/categories_screen.dart';

class CategoriesWithSupplementScreen extends StatelessWidget{
  const CategoriesWithSupplementScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const  Size.fromHeight(100),
        child: AppBarWidget(
          appBarTitle: "Categories",
          icon: "assets/icons/cart.svg",
          isLeadingIconActivated: true,
          isSearchBarActivated: false,
          isCartScreen: false,
          isPharmacySearchScreen: false,
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    "SUPPLLEMENTS",
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
                  return ProductCard(products: productList[index],index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}