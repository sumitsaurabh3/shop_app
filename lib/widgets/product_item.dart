import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

import '../models/providers/cart.dart';
import '../models/providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // const ProductItem(
  //     {super.key,
  //     // required this.id,
  //     // required this.title,
  //     // required this.imageUrl,
  //     });
  // final String id;
  // final String title;
  // final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart=Provider.of<Cart>(context,listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.deepOrange,
                ),
              ),),
              trailing: IconButton(
                onPressed: () {
                 cart.addItem(
                     product.id,
                   product.price,
                   product.title,
                 );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),

    );
  }
}
