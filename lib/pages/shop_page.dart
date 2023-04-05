import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add coffee to cart
  void addCoffee(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading message
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(
                height: 25,
              ),

              //list of coffee to buy
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    //get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];

                    //return the tile for this coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => addCoffee(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
