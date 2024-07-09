import 'package:get/get.dart';

import '../models/product.dart';

class CardController extends GetxController{
  var cardItems = <Product>[].obs;
  int get count => cardItems.length;
 double get  totalPrice =>cardItems .fold(0, (sum, item) => sum +item.price);
  addToCard(Product product){
    cardItems.add(product);
  }

}