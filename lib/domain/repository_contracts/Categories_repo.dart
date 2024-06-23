import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/entites/CategoryEntity.dart';

abstract class CategoriesRepo{
 Future<Either <List<CategoryEntity>,String>> getCategories();
}