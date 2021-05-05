import 'package:ecom_ui/state/productState.dart';
import 'package:ecom_ui/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  final bool favoriteOnly;
  AllProducts(this.favoriteOnly);
  @override
  Widget build(BuildContext context) {
    final prddata = Provider.of<ProductState>(context, listen: false);
    final product = favoriteOnly ? prddata.onlyFavorites : prddata.product;
    return GridView.builder(
      padding: const EdgeInsets.all(7),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: product.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: product[i],
        child: SingleProduct(),
      ),
    );
  }
}
