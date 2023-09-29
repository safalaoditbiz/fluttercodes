import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx22/controller/cartcontroller.dart';
import 'package:getx22/controller/cartcontroller.dart';
import 'package:getx22/controller/wishcontroller.dart';
import 'package:getx22/screens/productdetail.dart';

import '../controller/productcontroller.dart';

class ProductsGrid extends StatelessWidget {
  // final bool showFavourites;

  // ProductsGrid(
  //   this.showFavourites,
  // );
  final controller = Get.put(ProductController());

  final cartController = Get.put(CartController());
  final whishController = Get.put(WishController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: controller.items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        
        return GetBuilder(
          init: ProductController(),
          builder: (value) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    ProductDetailsScreen(
                      controller.items[index].productTitle,
                      controller.items[index].price,
                      controller.items[index].imageUrl,
                      controller.items[index].description,
                      controller.items[index].id,
                    ),
                  );
                },
                child: Image.network(
                  "http://192.168.149.211:8080/shopgetx/images/" +
                      controller.items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Color.fromARGB(221, 254, 253, 253),
                leading: IconButton(
                  icon: Icon(
                    controller.items[index].isFavourite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.pink,
                    //Icons.favorite_border_rounded,
                    // color: Image == null ? Colors.red : Colors.blue),

                    //color: Colors.pink,),
                  ),
                  onPressed: () {
                    whishController.addItem(
                      controller.items[index].id,
                      controller.items[index].price,
                      controller.items[index].productTitle,
                      1,
                      controller.items[index].imageUrl,
                    );
                  },
                ),
                title: Text(
                  controller.items[index].productTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                trailing: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont) {
                      return IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          cartController.addItem(
                            controller.items[index].id,
                            controller.items[index].price,
                            controller.items[index].productTitle,
                            1,
                            controller.items[index].imageUrl,
                          );
                        },
                        color: Theme.of(context).accentColor,
                      );
                    }),
              ),
            ),
          ),
        );
      },
    );
  }
}
