import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:flutter_sales/model/product_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListViewBuilder extends StatelessWidget {
  final List<ProductModel> lsProducts;

  const ListViewBuilder(this.lsProducts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lsProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => context.go('/list/detail', extra: lsProducts[index]),
            child: ListTile(
              leading: Hero(
                  tag: lsProducts[index].id,
                  child: Image.network(lsProducts[index].image,
                      loadingBuilder: (_,child,loadingProgress){
                        if (loadingProgress == null) return child;
                        return const CircularProgressIndicator();
                      }),
              ),
              title: Text(lsProducts[index].nom),
              subtitle: Text(
                "${lsProducts[index].prix} €",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing:TextButton(
                onPressed: () =>context.read<CartModel>().addProduct(lsProducts[index]),
                child: Text("ADD"),
              )
              ,
            ),
          );
        });
  }
}
