import 'dart:convert';
import 'package:e_comme_mob/apirequest/uriapiurl.dart';
import 'package:http/http.dart' as http;
import 'icategoryservice.dart';

class CategoryService implements ICategoryService {
  @override
  Future<List<String>> getCategories() async {
    try {
      UrlRequest urlRequest = UrlRequest();
      final response = await http.get(urlRequest.categoryRequestUri);
      if (response.body.isNotEmpty) {
        List category = (json.decode(response.body) as List);
        List<String> categoriesDesi = [];
        for (String tag in category) {
          categoriesDesi.add(tag);
        }
        return categoriesDesi;
      } else {
        throw Exception("Failed to load categoy response");
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
