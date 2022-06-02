class Products {
  final String productName;
  final String productImage;
  final String productType;
  final String productMeasurement;
  final int productPrice;
  final int initialPrice;
  final bool requiresPrescription;
  final List<ProductDetails> productDetails;

  Products({
    required this.productPrice,
    required this.requiresPrescription,
    required this.productName,
    required this.productImage,
    required this.productType,
    required this.productMeasurement,
    required this.initialPrice,
    required this.productDetails,
  });
}

class ProductDetails {
  final String productPackSize;
  final String productID;
  final String productConstituent;
  final String productDispensedIn;
  final String productDescription;
  final String productSeller;
  final String productSellerImage;

  ProductDetails({
    required this.productPackSize,
    required this.productID,
    required this.productConstituent,
    required this.productDispensedIn,
    required this.productDescription,
    required this.productSeller,
    required this.productSellerImage,
  });
}

List<Products> productList = [
  Products(
      productPrice: 350,
      requiresPrescription: false,
      productName: "Paracetamol",
      productImage: "assets/images/paracetamol.png",
      productType: "Tablet",
      productMeasurement: "500mg",
      initialPrice: 350,
      productDetails: List<ProductDetails>.from(productDetailList)),
  Products(
      productPrice: 350,
      requiresPrescription: true,
      productName: "Doliprane",
      productImage: "assets/images/doliprane.png",
      productType: "Capsule",
      productMeasurement: "1000mg",
      initialPrice: 350,
      productDetails: List<ProductDetails>.from(productDetailList)),
  Products(
      productPrice: 350,
      requiresPrescription: true,
      productName: "Paracetamol",
      productImage: "assets/images/ratiopharm.png",
      productType: "Tablet",
      productMeasurement: "500mg",
      initialPrice: 350,
      productDetails: List<ProductDetails>.from(productDetailList)),
  Products(
      productPrice: 350,
      requiresPrescription: false,
      productName: "Ibuprofen",
      productImage: "assets/images/ibuprofen.png",
      productType: "Tablet",
      productMeasurement: "200mg",
      initialPrice: 350,
      productDetails: List<ProductDetails>.from(productDetailList)),
  Products(
      productPrice: 350,
      requiresPrescription: false,
      productName: "Panadol",
      productImage: "assets/images/panadoll.png",
      productType: "Tablet",
      productMeasurement: "500mg",
      initialPrice: 350,
      productDetails: List<ProductDetails>.from(productDetailList)),
  Products(
      productPrice: 350,
      requiresPrescription: false,
      productName: "Ibuprofen",
      productImage: "assets/images/ibuprofen_red.png",
      productType: "Tablet",
      productMeasurement: "400mg",
      initialPrice: 350,
      productDetails: List<ProductDetails>.from(productDetailList)),
];

List<ProductDetails> productDetailList = [
  ProductDetails(
    productPackSize: "8 x 12 tablets (96)",
    productID: "PRO23648856",
    productConstituent: "Paracetamol",
    productDispensedIn: "Packs",
    productDescription: "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
    productSeller: 'Paracetamol Pharmaceuticals',
    productSellerImage: 'assets/images/emzor_logo.png',
  ),
  ProductDetails(
    productPackSize: "8 x 12 tablets (96)",
    productID: "PRO23648856",
    productConstituent: "Paracetamol",
    productDispensedIn: "Packs",
    productDescription: "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
    productSeller: 'Doliprane Pharmaceuticals',
    productSellerImage: 'assets/images/emzor_logo.png',
  ),
  ProductDetails(
    productPackSize: "8 x 12 tablets (96)",
    productID: "PRO23648856",
    productConstituent: "Paracetamol",
    productDispensedIn: "Packs",
    productDescription: "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
    productSeller: 'Paracetamol Pharmaceuticals',
    productSellerImage: 'assets/images/emzor_logo.png',
  ),
  ProductDetails(
    productPackSize: "8 x 12 tablets (96)",
    productID: "PRO23648856",
    productConstituent: "Paracetamol",
    productDispensedIn: "Packs",
    productDescription: "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
    productSeller: 'Ibuprofen Pharmaceuticals',
    productSellerImage: 'assets/images/emzor_logo.png',
  ),
  ProductDetails(
    productPackSize: "8 x 12 tablets (96)",
    productID: "PRO23648856",
    productConstituent: "Paracetamol",
    productDispensedIn: "Packs",
    productDescription: "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
    productSeller: 'Panadol Pharmaceuticals',
    productSellerImage: 'assets/images/emzor_logo.png',
  ),
  ProductDetails(
    productPackSize: "8 x 12 tablets (96)",
    productID: "PRO23648856",
    productConstituent: "Paracetamol",
    productDispensedIn: "Packs",
    productDescription: "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
    productSeller: 'Ibuprofen Pharmaceuticals',
    productSellerImage: 'assets/images/emzor_logo.png',
  ),
];
