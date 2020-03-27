

import 'dart:convert';
import 'package:save_me/Constants/constatants.dart';
import 'package:save_me/Models/product.dart';
import 'package:http/http.dart' as http ;
class DataController {
  Future<List<Product>> browse() async{
    http.Response response = await http.get(jsonPath);
    List collection = json.decode(response.body);
    return collection.map((list)=>Product.fromJson(list)).toList();
  }
}
