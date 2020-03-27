import 'package:equatable/equatable.dart';

import 'product.dart';

class Basket extends Equatable {
  Map<Product,int> products;
  Basket() {
    this.products = Map<Product, int>();
  }

  @override
  List<Map<Product, int>> get props => [products];
}
