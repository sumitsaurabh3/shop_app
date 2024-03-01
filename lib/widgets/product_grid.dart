import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/providers/products.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid( {super.key, required this.showFavs});
  final bool showFavs;
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = showFavs?productData.favoriteItems:productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (ctx, i) => 
         ChangeNotifierProvider.value(
          // create: (BuildContext context,)  =>products[i]  ,
           value: products[i],
           child:  ProductItem(
                   // id: products[i].id,
                   // title: products[i].title,
                   // imageUrl: products[i].imageUrl,
                 ),
         ),
    );
  }
}
