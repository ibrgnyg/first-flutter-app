import 'package:e_comme_mob/convertmodels/product.dart';

abstract class IProductService {
  Future<List<Product>> getProducts();
  Future<Product> getProduct(int id);
}
