import 'package:flutter/material.dart';
import 'package:save_me/Constants/constatants.dart';
import 'package:save_me/Models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Widget button;
  final Widget background;

  ProductCard({this.background, this.button, this.product});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        type: MaterialType.canvas,
        elevation:3,
        shadowColor: Colors.grey[100],
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
            ),
            Align(
              child: Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    product.name,
                    style: mainText,
                  ),
                  subtitle: Text(
                    product.price.toString() + " DA",
                    style: subText,
                  ),
                  trailing: button,
                ),
              ),
              alignment: Alignment.bottomCenter,
            )
          ]),
        ),
      ),
    );
  }
}
