import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  void addtocart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Add this item to your cart?"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);

                      context.read<Shop>().addtocard(product);
                    },
                    child: const Text("yes"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25),
        width: 300,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    child: const Icon(Icons.favorite),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(product.description,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
                Row(
                  children: [
                    Text('/Rs' + product.price.toStringAsFixed(2)),
                    Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                            onPressed: () => addtocart(context),
                            icon: const Icon(Icons.add)))
                  ],
                )
              ])
            ]));
  }
}
