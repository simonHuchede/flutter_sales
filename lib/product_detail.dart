import 'package:flutter/material.dart';
import 'package:flutter_sales/model/product_model.dart';
import 'package:go_router/go_router.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetail(this.productModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail"), actions: [
        IconButton(
            onPressed: () => context.go('/list'), icon: Icon(Icons.home)),
        IconButton(
            onPressed: () => context.go('/list/cart'),
            icon: const Icon(Icons.shopping_cart)),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                  tag: productModel.id,
                  child: Image.network(productModel.image,
                      loadingBuilder: (_,child,loadingProgress){
                    if (loadingProgress == null) return child;
                    return const CircularProgressIndicator();
                      },
                      width: 150, height: 150)),
            ),
            Center(
              child: Text(" ${productModel.nom}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Center(
              child: Text(" ${productModel.description}"),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Avis',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            TextButton(
              onPressed: () => context.go('/list/detail/avis',extra: productModel),
              child: Text(" ${productModel.description}"),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Caractéristiques',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Center(
              child: Text(" ${productModel.description}"),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
