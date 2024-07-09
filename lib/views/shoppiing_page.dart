import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopee/controllers/card_controller.dart';
import 'package:online_shopee/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final ShoppingController shoppingController = Get.put(ShoppingController());
  final CardController cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (shoppingController) {
                  return ListView.builder(
                    itemCount: shoppingController.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        shoppingController.products[index]
                                            .productName,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(shoppingController.products[index]
                                          .productDescription),
                                    ],
                                  ),
                                  Text(
                                    '\$${shoppingController.products[index]
                                        .price}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cardController.addToCard(
                                      shoppingController.products[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue, // Background color
                                  onPrimary: Colors.white, // Text color
                                ),
                                child: Text('Add to Cart'),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CardController>(
                builder: (controller) {
                  return Text('Total Amount:\$ ${controller.totalPrice}',
                    style: TextStyle(
                        fontSize: 33, color: Colors.white
                    ),);
                }
            ),
            SizedBox(height: 100,)
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: Icon(Icons.add_shopping_cart, color: Colors.black,),
          label: GetX<CardController>(
            builder: (controller) {
              return Text(controller.count.toString(),style: TextStyle(
                color: Colors.black,fontSize: 48
              ),);
            },
          )),

    );
  }
}
