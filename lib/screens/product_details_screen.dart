import 'package:ecom_ui/models/product.dart';
import 'package:ecom_ui/state/productState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreens extends StatelessWidget {
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final prodId = ModalRoute.of(context).settings.arguments as String;
    final Product product =
        Provider.of<ProductState>(context, listen: false).singleProduct(prodId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.imageUrl,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 10),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text("\$${product.price}"),
            SizedBox(height: 10),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
