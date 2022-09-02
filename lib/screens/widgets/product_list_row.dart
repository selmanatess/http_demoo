import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  late Product product;

  ProductListRowWidget(this.product){
    
  }

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.network(
                "https://pixabay.com/tr/photos/yumurta-yumurta-tutucu-%c3%bcreme-7345934/",
                height: 130.0,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),Text(product.productName),Text(product.unitsPrice.toString(),style: TextStyle(fontSize:18.0,color:Colors.grey),)
          ],
        ),
      ),
    );
  }
}
