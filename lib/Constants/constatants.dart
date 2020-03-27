//constants about the json file

import 'package:flutter/cupertino.dart';
import 'package:save_me/Models/client.dart';

String jsonPath = "https://jsonplaceholder.typicode.com/users";

String jsonProductName = "name";

String jsonProductPrice = "id";

String jsonSeller = "Seller";

//constants about the basket page decoration

const double appBarRadius = 20;

//gennral Constants

Color greenColor = Color(0xff76C5BA);

//Text styles

TextStyle mainText = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
TextStyle subText = TextStyle(fontSize: 17, fontWeight: FontWeight.w500);

//For instant this is the client once data is available i will modift this

  Client currentClient = new Client(name: "Someone");