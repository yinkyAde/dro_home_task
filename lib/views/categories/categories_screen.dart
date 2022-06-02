import 'package:dro_home_task/data/categories.dart';
import 'package:dro_home_task/widgets/category_card.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/appbar.dart';
import '../cart/cart_screen.dart';


class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: false,
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
            SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  left: defaultPadding * 2.0,
                  right: defaultPadding * 1.5,
                  top: defaultPadding,
                  bottom: defaultPadding,
                ),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                itemCount: demoCategories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(category: demoCategories[index], width: 170.0, height: 110.0,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}