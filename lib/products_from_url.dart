import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sales/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductCheckPage extends StatelessWidget {
  const ProductCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
    child: FutureBuilder<http.Response>(
    future: http.get(Uri.parse("https://fakestoreapi.com/products/")),
    builder: (_,snapshot){
      if(snapshot.hasData && snapshot.data != null){
    String body = snapshot.data!.body;
    List<ProductModel> lsProducts = (jsonDecode(body)as List)
    .map((e) => ProductModel.fromJson(e))
    .toList();

  }
      return const CircularProgressIndicator();
},
),
    ),
    );
  }
}
