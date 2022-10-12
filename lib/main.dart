import 'package:flutter/material.dart';
import 'package:flutter_sales/avis_page.dart';
import 'package:flutter_sales/cart_page.dart';
import 'package:flutter_sales/list_product_page.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:flutter_sales/product_detail.dart';
import 'package:flutter_sales/model/product_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<CartModel>(
    create: (_)=>CartModel([]),
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: const CartPage(),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(initialLocation: '/list', routes: <GoRoute>[
    GoRoute(
      path: '/list',
      builder: (_, GoRouterState state) => ListProductPage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'detail',
          builder: (_, GoRouterState state) =>
              ProductDetail(state.extra as ProductModel),
          routes: <GoRoute>[
            GoRoute(path: 'avis',
              builder: (_, GoRouterState state) =>
                  AvisProduct(state.extra as ProductModel))
          ]
        ),
        GoRoute(path: 'cart', builder: (_, GoRouterState state) => CartPage())
      ],
    ),
  ]);
}
