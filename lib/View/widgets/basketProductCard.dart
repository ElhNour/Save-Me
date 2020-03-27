import 'package:flutter/material.dart';
import 'package:save_me/Constants/constatants.dart';
import 'package:save_me/Models/product.dart';

class BasketProductCard extends StatefulWidget {
  final Product product;
  BasketProductCard({@required this.product});

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<BasketProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            color: Colors.grey,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(widget.product.name, style: mainText),
            Text(widget.product.price.toString() + " DA"),
          ]),
          Text(currentClient.basket.products[widget.product].toString(),
              style: mainText),
        ],
      ),
    );
  }
}
