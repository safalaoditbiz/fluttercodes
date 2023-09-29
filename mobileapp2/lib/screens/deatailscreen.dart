import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({Key? key});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  int quantity = 0;
  double price = 0.0;
  void incrementQuantity() {
    setState(() {
      quantity++;
      price += 20;
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
        price -= 20;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: 405,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/images/girl.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 25, right: 25, bottom: 275),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/arrow.png"),
                    Image.asset("assets/images/cart2.png"),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 3,
                //     spreadRadius: 0.01,
                //     color: Color.fromARGB(255, 154, 151, 151),
                //   ),
                // ],
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Roller Rabit"),
                              Text("yado odellis dress"),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 38,
                          width: 112,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 184, 178, 178)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              quantity == 0
                                  ? IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: null,
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: decrementQuantity,
                                    ),
                              Text(
                                '$quantity',
                                style: TextStyle(fontSize: 24),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: incrementQuantity,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            'Total Price: \$${price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
