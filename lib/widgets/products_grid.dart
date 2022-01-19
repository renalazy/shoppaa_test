import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatefulWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        widget.showFavs ? productsData.favoriteItems : productsData.items;
    bool isLoadingVertical = false;
    final int increment = 8;
    int productLength = products.length;

    Future _loadMoreVertical() async {
      setState(() {
        isLoadingVertical = true;
      });
      await new Future.delayed(const Duration(seconds: 2));
      // products
      //     .addAll(List.generate(increment, (index) => products.length + index));

      setState(() {
        isLoadingVertical = false;
      });
    }

    return LazyLoadScrollView(
      onEndOfPage: () => _loadMoreVertical(),
      child: Scrollbar(
        child: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: products.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: products[i],
            child: ProductItem(),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
