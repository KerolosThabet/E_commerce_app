import 'package:e_commerce_route/data/model/categories_response/CategoriesResponse.dart';

abstract class CategoriesDataSource {
  Future<CategoriesResponse?> getCategories();
}