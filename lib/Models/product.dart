import 'package:meta/meta.dart';
import 'package:save_me/Constants/constatants.dart';
class Product {
  String name;
  int price;

  Product({@required this.name, @required this.price});

  Product.fromJson(Map<String, dynamic> json): this.name = json[jsonProductName] , this.price=json[jsonProductPrice];
}
