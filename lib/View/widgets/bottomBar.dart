import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(icon: Icon(Icons.home , size: 27,), onPressed: null),
        IconButton(icon: Icon(Icons.location_on,size: 27), onPressed: null),
        IconButton(icon: Icon(Icons.calendar_today, size: 27), onPressed: null),
        IconButton(icon: Icon(Icons.notifications, size: 27), onPressed: null),
      ],
    );
  }
}