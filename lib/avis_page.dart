import 'package:flutter/material.dart';
import 'package:flutter_sales/model/product_model.dart';
import 'package:flutter_sales/model/star_model.dart';
import 'package:go_router/go_router.dart';

class AvisProduct extends StatelessWidget {
  final ProductModel productModel;

  const AvisProduct(this.productModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Avis"), actions: [
          IconButton(
              onPressed: () => context.go('/list'), icon: Icon(Icons.home)),
          IconButton(
              onPressed: () => context.go('/list/cart'),
              icon: const Icon(Icons.shopping_cart)),
        ]),
        body: ListView.builder(
            itemCount: productModel.avis.length,
            itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    ListTile(
                      title: Text(productModel.avis[index].username,
                          style: Theme.of(context).textTheme.headline4),
                      subtitle: Column(
                        children: [
                          StarDisplay(value: productModel.avis[index].note),
                          Row(
                            children: [
                              Text("Avis : ",
                                  style: Theme.of(context).textTheme.headline6),
                              Text(productModel.avis[index].descprition),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ],
                )));
  }
}
