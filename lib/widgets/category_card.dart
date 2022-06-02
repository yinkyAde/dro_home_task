import 'package:dro_home_task/views/categories_with_supplement/categories_with_supplement_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/categories.dart';

class CategoryCard extends StatelessWidget {

  final Category category;
  const CategoryCard({Key? key, required this.category, required this.width, required this.height}) : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: height,
      margin: const EdgeInsets.only(right: defaultPadding),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(category.categoryImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CategoriesWithSupplementScreen()));
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
           Align(
              alignment: Alignment.center,
              child: Text(
                category.categoryTitle,
                style: const TextStyle(
                  color: droWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              )),
        ],
      ),
    );
  }
}
