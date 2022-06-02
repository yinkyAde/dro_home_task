import 'package:dro_home_task/widgets/float_button_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../data/products.dart';
import '../../db_helper/db_helper.dart';
import '../../model/cart.dart';
import '../../repository/cart_provider.dart';
import '../../widgets/appbar.dart';
import '../../widgets/product_card_with_addcart.dart';
import '../cart/cart_screen.dart';


class PharmacySearchScreen extends StatefulWidget {
  const PharmacySearchScreen({Key? key, required this.searchText})
      : super(key: key);

  @override
  PharmacySearchScreenState createState() => PharmacySearchScreenState();

  final String searchText;
}

class PharmacySearchScreenState extends State<PharmacySearchScreen> {

  DBHelper? dbHelper = DBHelper();

  bool isLikeSelected = false;
  List<Products> _searchList = [];

  bool? _isSearching;
  String _searchText = "";

  PharmacySearchScreenState() {
    searchEditingController.addListener(() {
      if (searchEditingController.text.isEmpty) {
        if (mounted) {
          setState(() {
            _isSearching = false;
            _searchText = "";
            _buildSearchList();
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _isSearching = true;
            _searchText = searchEditingController.text;
            _buildSearchList();
          });
        }
      }
    });
  }

  List<Products>? _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = productList;
    } else {
      // for (int i = 0; i < productList!.length; i++) {
      //   var name = productList!.elementAt(i) as String;
      //   if (name.toLowerCase().contains(_searchText.toLowerCase())) {
      //     _searchList.add(name);
      //   }
      // }
      // print(_searchList = productList
      //     .where((element) => element.productName
      //         .toLowerCase()
      //         .contains(_searchText.toLowerCase()))
      //     .toList());
      _searchList = productList
          .where((element) => element.productName
              .toLowerCase()
              .contains(_searchText.toLowerCase()))
          .toList();
      //print('${_searchList.length}');
      return _searchList;
    }
  }

  Future startSearch() {
    setState(() {
      _isSearching = true;
    });
    return startSearch();
  }

  void addCart(var cart, int index){
    dbHelper!.insert(
        Cart(
          id: index,
          productId: index.toString(),
          productName: _searchList[index].productName.toString(),
          productImage:_searchList[index].productImage.toString(),
          productType : _searchList[index].productType.toString(),
          productMeasurement :_searchList[index].productMeasurement.toString(),
          productPrice: _searchList[index].productPrice,
          quantity: 1,
          initialPrice: _searchList[index].initialPrice,

        )).then((value){

      cart.addTotalPrice(double.parse(_searchList[index].productPrice.toString()));
      cart.addCounter();

      const snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Product is added to cart'), duration: Duration(seconds: 1),);

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }).onError((error, stackTrace){
      //print("error$error");
      const snackBar = SnackBar(backgroundColor: Colors.red ,content: Text('Product is already added in cart'), duration: Duration(seconds: 1));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  initState() {
    super.initState();
    // _IsSearching = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchEditingController.text = widget.searchText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBarWidget(
          appBarTitle: "Pharmacy",
          icon: "assets/icons/van.svg",
          isLeadingIconActivated: true,
          isSearchBarActivated: true,
          isCartScreen: false,
          isPharmacySearchScreen: true,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _searchList.isEmpty
                ? Container()
                : Container(
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
            _searchList.isEmpty
                ? SizedBox(
                    child: Column(
                    children: [
                      const SizedBox(height: defaultPadding * 2.0),
                      Image.asset("assets/images/404_error.png"),
                      Text(
                        "No result found for “${searchEditingController.text}”",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.0),
                      ),
                    ],
                  ))
                : SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        left: defaultPadding * 1.5,
                        right: defaultPadding * 1.5,
                        top: defaultPadding,
                        bottom: defaultPadding,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .55,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: _searchList.length,
                      itemBuilder: (context, index) {
                        return ProductCardWithAddCart(
                          products: _searchList[index],
                          index: index,
                          onAddCartPressed: () {
                            addCart(cart, index);
                          },
                          onLikePressed: () {
                            setState((){
                              isLikeSelected = !isLikeSelected;
                            });
                          },
                          isLikeSelected: isLikeSelected,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingButtonCircleWidget(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CartScreen()));
      }, totalCart: cart.getCounter().toString(),),
    );
  }
}
