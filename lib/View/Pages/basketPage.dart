import 'dart:math';

import 'package:flutter/material.dart';
import 'package:save_me/Constants/constatants.dart';
import 'package:save_me/View/widgets/basketProductCard.dart';
import 'package:save_me/View/widgets/bottomBar.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = List<Widget>();
    currentClient.basket.products.forEach((product, number) {
      children.add(BasketProductCard(product: product));
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Container(
          height: 100,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(appBarRadius),
                bottomRight: Radius.circular(appBarRadius)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              Text(
                'Mon Panier',
                style: mainText.apply(color: Colors.white),
              ),
              SizedBox(width: 30)
            ],
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              Column(children: children),
              Text(
                "Total : " +
                    currentClient.calculatePrice().toInt().toString() +
                    " DA",
                style: mainText.apply(fontSizeFactor: 1.5, fontWeightDelta: -2),
              ),
            ],
          )),
      bottomNavigationBar: Container(
        height: 164,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: () {
                int price =  currentClient.calculatePrice().toInt();
                if (currentClient.calculatePrice() != 0.0) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(appBarRadius),
                                    topRight: Radius.circular(appBarRadius))),
                            padding: EdgeInsets.all(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Merci d\'avoir soumis votre commande',
                                  style: mainText.apply(
                                      fontSizeFactor: 1.5,
                                      color: Color(0xffFF9100)),
                                  textAlign: TextAlign.center,
                                ),
                                Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Numero De commande : ',
                                        style: mainText,
                                      ),
                                      Text(Random().nextInt(80000).toString(),
                                          style: mainText)
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total ', style: mainText),
                                        Text(
                                            price.toString()+" DA",
                                            style: mainText),
                                      ])
                                ])
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                      backgroundColor: Colors.transparent);
                }
                currentClient.buy();
                setState(() {
                  
                });
                
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color(0xffFF9100),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                  child: Text(
                    'Soumettre la commande',
                    style: mainText.apply(color: Colors.white),
                  ),
                ),
              ),
            ),
            Material(
                type: MaterialType.canvas,
                elevation: 12,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(appBarRadius),
                    topLeft: Radius.circular(appBarRadius)),
                color: Colors.transparent,
                child: Container(
                  child: BottomBar(),
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(appBarRadius),
                          topLeft: Radius.circular(appBarRadius))),
                )),
          ],
        ),
      ),
    );
  }
}
