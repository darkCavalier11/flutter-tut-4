import 'package:flutter/material.dart';
import 'package:tut_/providers/cart.dart';
import 'package:tut_/providers/orders.dart';
import 'package:tut_/screens/cart_screen.dart';
import 'package:tut_/screens/orders_screen.dart';
import 'package:tut_/screens/product_detail_screen.dart';
import 'package:tut_/screens/products_overview_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // *providing multiple provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          accentColor: Colors.greenAccent,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
