import 'model_product.dart';

abstract class Customer {
  final String cardCode;
  final String cardName;
  final List<Product> products;

  Customer(
      {required this.cardCode, required this.cardName, required this.products});
}
