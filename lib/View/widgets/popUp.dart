import 'package:flutter/material.dart';
import 'package:save_me/Constants/constatants.dart';
import 'package:save_me/Models/product.dart';

class PopWindow extends StatefulWidget {
  PopWindow({
    @required this.product,
    double height = 300.0,
    double radius = appBarRadius,
    @required this.button,
  }) {
    this.radius = radius;
    this.height = height;
  }
  Widget button;
  final Product product;
  double radius;
  double height;
  @override
  _PopWindowState createState() => _PopWindowState();
}

class _PopWindowState extends State<PopWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                widget.product.name,
                style: mainText,
              ),
              Text(
                widget.product.price.toString()+" DA",
                style: subText,
              ),
            ],
          ),
          widget.button,
        ],
      ),
      height: widget.height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.radius),
            topRight: Radius.circular(widget.radius),
          )),
    );
  }
}
