
import 'dart:async';

import 'package:save_me/Data%20Controller/dataController.dart';
import 'package:save_me/Models/product.dart';
class PageBloc {

  StreamController<int> _countController = new StreamController<int>();
  Stream<int> get counter => _countController.stream; 

  Stream<List<Product>> get products async* {
    yield await DataController().browse();

  }

  PageBloc(){
    products.listen((list)=>_countController.add(list.length));
  }
}
