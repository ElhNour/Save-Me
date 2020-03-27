import 'package:flutter/material.dart';
import 'package:save_me/BLoC/bloc.dart';
import 'package:save_me/Constants/constatants.dart';
import 'package:save_me/Models/product.dart';
import 'package:save_me/View/Pages/basketPage.dart';
import 'package:save_me/View/widgets/bottomBar.dart';
import 'package:save_me/View/widgets/popUp.dart';
import 'package:save_me/View/widgets/productCard.dart';

class ClientAddedObjects extends StatefulWidget {
  @override
  _ClientAddedObjectsState createState() => _ClientAddedObjectsState();
}

class _ClientAddedObjectsState extends State<ClientAddedObjects> {
  @override
  Widget build(BuildContext context) {
    PageBloc bloc = new PageBloc();
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              child: Container(
                alignment: Alignment.center,
                color: greenColor,
                child: Text(
                  currentClient.name,
                  style: mainText.apply(color: Colors.white),
                ),
              ),
              aspectRatio: 1,
            )
          ],
        ),
      ),
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Builder(
              builder: (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  }),
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, ___, __) => BasketPage()));
              },
            )
          ]),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 12, right: 12, left: 12),
          child: StreamBuilder(
              stream: bloc.products,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Product>> snapshot) {
                List<Product> products = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      backgroundColor: greenColor,
                    ));
                    break;
                  case ConnectionState.waiting:
                    return Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      backgroundColor: greenColor,
                    ));
                    break;
                  case ConnectionState.active:
                    return Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      backgroundColor: greenColor,
                    ));
                    break;
                  case ConnectionState.done:
                    return ListView.separated(
                        itemBuilder: (context, index) => ProductCard(
                              product: products[index],
                              button: InkWell(
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: greenColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  onTap: () => showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) => PopWindow(
                                          product: products[index],
                                          button: InkWell(
                                            onTap: () {
                                              currentClient
                                                  .addToBasket(products[index]);
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 200,
                                              color: greenColor,
                                              child: Center(
                                                child: Text(
                                                  'Ajouter au Panier',
                                                  style: mainText.apply(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          height: 500))),
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                        itemCount: products?.length ?? 0);

                    break;
                  default:
                    return Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      backgroundColor: greenColor,
                    ));

                    break;
                }
              })),
      bottomNavigationBar: Material(
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
    );
  }
}
