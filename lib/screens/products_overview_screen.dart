import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

enum FilterOptions{
  favorites,
  all,
}
class ProductOverviewScreen extends StatefulWidget {
   const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Shop',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){
              setState(() {
                if (selectedValue==FilterOptions.favorites){
                  _showOnlyFavorites=true;
                }
                else{
                  _showOnlyFavorites=false;
                }
              });

            },
            itemBuilder:(_)=>[
            const PopupMenuItem(value:FilterOptions.favorites ,child: Text('Only Favorites'),),
            const PopupMenuItem(value: FilterOptions.all,child: Text('Show All'),),
          ],icon:const Icon(Icons.more_vert) ,)
        ],
      ),
      body: ProductGrid(showFavs: _showOnlyFavorites,),
    );
  }
}
