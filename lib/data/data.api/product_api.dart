// ignore: import_of_legacy_library_into_null_safe
import "package:http/http.dart" as http;

class ProductApi {
  static Future getProducts() {
    return http.get(Uri.parse("http://localhost:3000/products"));
  }

  static Future getProductsByCategoryId(int categoryID) {
    return http.get(
        Uri.parse("http://localhost:3000/products?categoryId=$categoryID"));
  }
}
