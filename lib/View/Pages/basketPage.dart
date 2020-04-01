import 'dart:math';
import 'package:flutter/material.dart';
import 'package:save_me/Constants/constatants.dart';
import 'package:save_me/View/widgets/basketProductCard.dart';
import 'package:save_me/View/widgets/bottomNavigationBar.dart';

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
          height: 80,
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
          padding: EdgeInsets.all(10),
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
                int price = currentClient.calculatePrice().toInt();
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
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 20.0,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.close)),
                                  alignment: Alignment.topLeft,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Merci d\'avoir soumis votre commande',
                                  style: mainText.apply(
                                    fontSizeFactor: 1,
                                    color: orangeColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Numero de commande : ',
                                        style: bsktprdct,
                                      ),
                                      Text(
                                          //currentClient.basket.id.toString()
                                          Random().nextInt(80000).toString(),
                                          style: bsktprdct)
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total ', style: bsktprdct),
                                        Text(price.toString() + " DA",
                                            style: bsktprdct),
                                      ])
                                ])
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                      backgroundColor: Colors.transparent);
                }
                currentClient.buy();
                setState(() {});
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                  child: Text(
                    'Soumettre la commande',
                    style: mainText.apply(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            BotomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
