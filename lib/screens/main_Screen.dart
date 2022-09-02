// Ignore: unused_import
import 'dart:convert';

import "package:http/http.dart" as http;

import 'package:flutter/material.dart';
import 'package:http_demoo/data/data.api/category_api.dart';
import 'package:http_demoo/data/data.api/product_api.dart';
import 'package:http_demoo/models/category.dart';
import 'package:http_demoo/models/product.dart';
import 'package:http_demoo/screens/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = [];
  List<Widget> categoryWidget = [];
  List<Product> products = [];
  @override
  void initState() {
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidget,
              ),
            ),
            ProductListWidget(products)
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    categoryApi.getCategories().then((response) => {
          setState(() {
            Iterable list = json.decode(response.body);
            this.categories ==
                list.map((category) => Category.fromJson(category)).toList();
            getCategoryWidgets();
          })
        });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidget.add(getCategoryWidget(categories[i]));
    }
    return categoryWidget;
  }

  Widget getCategoryWidget(Category category) {
    return FlatButton(
      onPressed: (() {
        getProductByCategoryId(category);
      }),
      child: Text(
        category.categoryName,
        style: TextStyle(color: Colors.blueGrey),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.lightGreenAccent)),
    );
  }

  void getProductByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products ==
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
