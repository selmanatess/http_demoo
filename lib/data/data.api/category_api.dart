// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class categoryApi {
  static Future getCategories() {
    return http.get(Uri.parse("http://localhost:3000/categories"));
  }
}
