import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../views/pharmacy_search/pharamcy_search_screen.dart';

TextEditingController searchEditingController = TextEditingController();

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.icon,
    required this.appBarTitle,
    required this.isLeadingIconActivated,
    required this.isSearchBarActivated,
    required this.onPressed,
    required this.isCartScreen,
    required this.isPharmacySearchScreen,
  }) : super(key: key);

  final String icon;
  final String appBarTitle;
  final bool isLeadingIconActivated;
  final bool isSearchBarActivated;
  final bool isCartScreen;
  final bool isPharmacySearchScreen;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //toolbarHeight: 150,
      // title: const Text("Custom App Bar"),
      // centerTitle: true,
      leading: Container(),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage(
                "assets/images/appbar_bg.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: isLeadingIconActivated == true
                    ? defaultPadding
                    : defaultPadding * 1.5,
                right: defaultPadding,
                top: defaultPadding * 3.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isLeadingIconActivated == true
                      ? Expanded(
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(CupertinoIcons.chevron_back,
                                color: droWhite.withOpacity(0.7)),
                          ),
                        )
                      : Container(),
                  isCartScreen == true
                      ? const SizedBox(width: defaultPadding / 2.0)
                      : Container(),
                  isCartScreen == true
                      ? GestureDetector(
                          onTap: () {
                            onPressed;
                          },
                          child: SvgPicture.asset("assets/icons/cart.svg"))
                      : Container(),
                  isCartScreen == true
                      ? const SizedBox(width: defaultPadding / 2.0)
                      : Container(),
                  Expanded(
                    flex: isLeadingIconActivated == true ? 10 : 12,
                    child: Text(
                      appBarTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: droWhite),
                    ),
                  ),
                  isCartScreen != true
                      ? Expanded(
                          flex: 2,
                          child: Badge(
                            shape: BadgeShape.circle,
                            badgeColor: droBadgeColor,
                            padding: const EdgeInsets.all(defaultPadding / 4.0),
                            position: BadgePosition.topEnd(top: 12, end: 12),
                            child: IconButton(
                              onPressed: onPressed,
                              icon: SvgPicture.asset(icon),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            isSearchBarActivated == true
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: defaultPadding * 1.5,
                      right: defaultPadding,
                      top: defaultPadding,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: searchEditingController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.search,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Serach",
                              hintStyle: const TextStyle(
                                color: droWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: droWhite,
                                size: 24,
                              ),
                              fillColor: droWhite.withOpacity(0.3),
                              filled: true,
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.all(defaultPadding / 2.0),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              // If  you are using latest version of flutter then lable text and hint text shown like this
                              // if you r using flutter less then 1.20.* then maybe this is not working properly
                            ),
                            onFieldSubmitted: (value) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PharmacySearchScreen(
                                        searchText: value.toString(),
                                      )));
                            },
                            //validator: emailValidator,
                            //onSaved: (value) => searchEditingController.text = email!,
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        isPharmacySearchScreen == true ? Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                searchEditingController.clear();
                              },
                              child: const Text(
                                "Cancel",
                                style:  TextStyle(
                                    color: droWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0),
                              ),
                            )): Container(),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
