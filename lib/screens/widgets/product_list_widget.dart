import 'package:flutter/cupertino.dart';
import 'package:http_demoo/screens/widgets/product_list_row.dart';

import '../../models/product.dart';

class ProductListWidget extends StatefulWidget {
  List<Product>? products;
  ProductListWidget(List<Product> products) {
    this.products = products;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BuildProducList(context);
  }

  Widget BuildProducList(BuildContext context) {
    return Column(
      children: [SizedBox(height: 10.0,),

        GridView.count(crossAxisCount:2,
          children:  List.generate(
             widget.products!.length,
            ((index) {
              return ProductListRowWidget(widget.products![index]);
            })),
        ),
      ],
    );
  }
}
