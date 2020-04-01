import 'package:flutter/material.dart';
import 'package:save_me/Constants/constatants.dart';

import 'bottomBar.dart';
class BotomNavigationBar extends StatefulWidget {
  @override
  _BotomNavigationBarState createState() => _BotomNavigationBarState();
}

class _BotomNavigationBarState extends State<BotomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
          type: MaterialType.canvas,
          elevation: 12,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(appBarRadius),
              topLeft: Radius.circular(appBarRadius)),
          color: Colors.transparent,
          child: Container(
            child: BottomBar(),
            height: 62,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(appBarRadius),
                    topLeft: Radius.circular(appBarRadius))),
          ));
  }
}