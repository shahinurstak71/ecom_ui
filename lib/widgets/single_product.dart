import 'package:ecom_ui/models/product.dart';
import 'package:ecom_ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GridTile(
      header: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      footer: GridTileBar(
        leading: IconButton(
          onPressed: () {
            product.togoleFavorit();
          },
          icon: Icon(
            product.isFavorate ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
        title: Text(
          "\$$product.price",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: Icon(
          Icons.shopping_cart,
          color: Colors.red,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailsScreens.routeName,
              arguments: product.id);
        },
        child: Image.network(
          product.imageUrl,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
