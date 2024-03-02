import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/providers/products.dart';
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});
  static const routeName = '/product-detail-screen';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            SizedBox(
              height: 300,
              width: 400,
              child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover,),
            ),
            const SizedBox(height: 10,),
            Text('\$${loadedProduct.price}',style: const TextStyle(color: Colors.grey,fontSize: 20),),
            const SizedBox(height: 10,),
            Container(width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(loadedProduct.description,textAlign: TextAlign.center,softWrap: true,))
          ],
        ),
      ),
    );
  }
}
