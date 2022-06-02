class Cart {
  final int id;
  final String productId;
  final String productName;
  final String productImage;
  final String productType;
  final String productMeasurement;
  final int initialPrice;
  final int productPrice;
  final int quantity;

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productType,
    required this.productMeasurement,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
  });

  Cart.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        productId = map['productId'],
        productName = map["productName"],
        productImage = map["productImage"],
        productType = map["productType"],
        productMeasurement = map["productMeasurement"],
        productPrice = map["productPrice"],
        initialPrice = map["initialPrice"],
        quantity = map["quantity"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'productType': productType,
      'productMeasurement': productMeasurement,
      'initialPrice': initialPrice,
      'productPrice': productPrice,
      'quantity': quantity,
    };
  }
}
