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
  void _incrementQuantity() {
      setState(() {
        currentClient.basket.products[widget.product]++;
      });
    }

    void _decrementQuantity() {
      setState(() {
        currentClient.basket.products[widget.product]--;
      });
    }
  @override
  Widget build(BuildContext context) {
    
    
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
          Container(
            height: 70,
            width: 70,
            color: Colors.grey,
            //child: widget.product.image
          ),
          SizedBox(
            width: 5.0,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.product.name, style: bsktprdct),
            Text(
              widget.product.price.toString() + " DA",
              style: bsktprdctprice,
            ),
            SizedBox(
              height: 20.0,
            )
          ]),
          Expanded(child: Container()),
           Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Column(
          children: <Widget>[
            InkWell(
                onTap: () {
                  if (currentClient.basket.products[widget.product] > 0) _decrementQuantity();
                  currentClient.removeFromBasket(widget.product);
                },
                child: Icon(Icons.minimize)),
            SizedBox(
              height: 15.0,
            ),
          ],
            ),
            SizedBox(
          width: 9.0,
            ),
            Container(
            width: 35.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: greenColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                  child: Text(
                currentClient.basket.products[widget.product].toString(),
                style: TextStyle(color: orangeColor, fontSize: 10.0),
              )),
            )),
            SizedBox(width:9.0),
            InkWell(
            onTap: () {
              _incrementQuantity();
              currentClient.addToBasket(widget.product);
            },
            child: Icon(Icons.add))]),
           ]));
  }
}
