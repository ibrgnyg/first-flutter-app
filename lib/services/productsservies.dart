import 'dart:convert';
import 'package:e_comme_mob/apirequest/uriapiurl.dart';
import 'package:e_comme_mob/convertmodels/product.dart';
import 'package:e_comme_mob/services/iproductservce.dart';
import 'package:http/http.dart' as http;

class ProductsService implements IProductService {
  @override
  Future<List<Product>> getProducts() async {
    try {
      UrlRequest urlRequest = UrlRequest();
      final response = await http.get(urlRequest.productRequestUri);
      if (response.body.isNotEmpty) {
        var list = json.decode(response.body) as List;
        List<Product> productsListRespponse =
            list.map((i) => Product.fromJson(i)).toList();
        return productsListRespponse;
      } else {
        throw Exception("Failed to load products response");
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }

  @override
  Future<Product> getProduct(int id) async {
    try {
      UrlRequest urlRequest = UrlRequest();
      final url = Uri.parse(
          urlRequest.productRequestUri.toString() + "/" + id.toString());
      final response = await http.get(url);
      if (response.body.isNotEmpty) {
        var productJson = json.decode(response.body);
        Product returnProduct = Product.fromJson(productJson);
        return returnProduct;
      } else {
        throw Exception("Failed to load product response");
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
