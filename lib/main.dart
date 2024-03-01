import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/providers/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';

import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';

import 'models/providers/products.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
    ChangeNotifierProvider(
      create:(ctx)=> Products()),
      ChangeNotifierProvider(
          create:(ctx)=> Cart()),

    ],
      child: MaterialApp(
        routes: {
          ProductDetailScreen.routeName:(ctx)=>const ProductDetailScreen(),
          CartScreen.routeName:(ctx)=>const CartScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: ('Shop App'),
        home:  const ProductOverviewScreen() ,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.purple),
          // primarySwatch: Colors.purple,

           fontFamily: 'Lato',
           textTheme: const TextTheme(
              titleMedium: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 24)
           ),

        ),
      ),
    );
  }
}
