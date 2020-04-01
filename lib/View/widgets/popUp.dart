import 'package:flutter/material.dart';
import 'package:save_me/Constants/constatants.dart';
import 'package:save_me/Models/product.dart';

class PopWindow extends StatefulWidget {
  PopWindow({
    @required this.product,
    double height = 300.0,
    double radius = appBarRadius,
    @required this.button,
  }) 
  {
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
  int _quantity=1;
  void _incrementQuantity(){setState((){_quantity++;});}
  void _decrementQuantity(){setState((){_quantity--;});}


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Stack(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(child: Image.asset('nutella.jpeg')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.product.name,
                style: mainText,
              ),
            ),
            Text(
              widget.product.price.toString() + " DA",
              style: subText,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 FlatButton(
                  onPressed: () {
                    if (_quantity > 0) {_decrementQuantity();
                    currentClient.removeFromBasket(widget.product);}
                  },
                  child: Icon(Icons.minimize),),
               SizedBox(width: 20.0),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: greenColor),
                    ),
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                          child: Text(
                        _quantity.toString(),
                        style: TextStyle(color: orangeColor, fontSize: 20.0),
                      )),
                    )),
                SizedBox(width: 20.0),
                FlatButton(
                  onPressed: () {
                    _incrementQuantity();
                    currentClient.addToBasket(widget.product);
                  },
                  child: Icon(Icons.add)),
              ],
            ),
            SizedBox(height: 15.0),
            widget.button,
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 260),
          child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close)),
        ),
      ]),
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
