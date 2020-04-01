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
Color greyColor= Color(0xffA2A2A2);
Color orangeColor= Color(0xffFF9100);
Radius radius= Radius.circular(20);
//Text styles

TextStyle mainText = TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
TextStyle subText = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
TextStyle bsktprdct= TextStyle(fontSize: 12,fontWeight: FontWeight.w500);
TextStyle bsktprdctprice= TextStyle(fontSize: 10,fontWeight: FontWeight.w500);
TextStyle btnText=TextStyle(fontSize: 15,fontWeight: FontWeight.w400);


//For instant this is the client once data is available i will modift this

  Client currentClient = new Client(name: "Someone");

