import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Panier Flutter Sales"), actions: [
          IconButton(
            onPressed: () => context.read<CartModel>().removeAllProducts(),
            icon: Icon(Icons.restore_from_trash),
          )
        ]),
        body: Container(
            child: Column(
                children: [
            Text(
            "Votre panier contient ${context
                .watch<CartModel>()
                .lsProducts
                .length}"
            " éléments"),
        Text("Votre panier total est de: ${context.watch<CartModel>().getTotalPrice()} €"),
        Consumer<CartModel>(
          builder: (_, cart, __) =>
          Expanded(
            child: ListView.builder(
                itemCount: cart.lsProducts.length,
                itemBuilder: (context, index) =>
                    ListTile(
                      leading:Hero(
                        tag: cart.lsProducts[index].id,
                      child: Image.network(cart.lsProducts[index].image),),
                      title: Text(cart.lsProducts[index].nom),
                      trailing: IconButton(
                        onPressed: () => context.read<CartModel>().remove(cart.lsProducts[index]),
                        icon: Icon(Icons.delete)
                      ),

                    )
            ),
          )

    )
    ]
    ,
    )
    )
    ,
    );
  }
}
