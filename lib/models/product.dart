class Product {
  late int id;
  late int categoryId;
  late int unitsPrice;
  late String productName;
  late String quantityPerUnit;
  late int unitsInStock;
  Product(this.id, this.categoryId, this.unitsPrice, this.productName,
      this.quantityPerUnit, this.unitsInStock);

  Product.fromJson(Map json) {
    id = json["id"];
    categoryId = json["categoryId"];
    unitsPrice = json["unitPrice"];
    productName = json["productName"];
    quantityPerUnit = json["quantityPerUnit"];
    unitsInStock = json["unitsInStock"];
  }
  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "unitsPrice": unitsPrice,
      "productName": productName,
      "quantityPerUnit": quantityPerUnit,
      "unitsInStock": unitsInStock
    };
  }
}
