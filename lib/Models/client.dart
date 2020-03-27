import 'package:save_me/Models/basket.dart';
import 'package:save_me/Models/product.dart';

class Client {
  final String name;
  Basket basket;
  Client({this.name}) {
    this.basket = Basket();
  }

  void addToBasket(Product product) {
    if (this.basket.products.containsKey(product)) {
      this.basket.products[product] ++;
    } else {
      this.basket.products.putIfAbsent(product, () => 1);
    }
  }

  double calculatePrice() {
    double finalPrice = 0.0;
    this.basket.products.forEach((product, value) {
      finalPrice = product.price * value + finalPrice;
    });
    return finalPrice;
  }

  void buy() {
    this.basket.products.clear();
  }
}

