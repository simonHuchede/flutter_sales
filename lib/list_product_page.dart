import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sales/list_view_builder.dart';
import 'package:flutter_sales/model/product_model.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class ListProductPage extends StatelessWidget {
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-commerce"), actions: [
        IconButton(
            onPressed: () => context.go('/list/cart'),
            icon: const Icon(Icons.shopping_cart)),
      ]),
      body: FutureBuilder<http.Response>(
        future: http.get(Uri.parse("https://fakestoreapi.com/products/")),
        builder: (_, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            String body = snapshot.data!.body;
            List<ProductModel> lsProducts = (jsonDecode(body) as List)
                .map((e) => ProductModel.fromJson(e))
                .toList();
            return ListViewBuilder(lsProducts);
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
