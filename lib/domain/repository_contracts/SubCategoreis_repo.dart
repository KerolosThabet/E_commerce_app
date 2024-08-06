import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/entites/SubcategoryEntity.dart';

abstract class SubCategoriesRepo{
 Future<Either<List<SubcategoryEntity>,String>> GetSubCategories(String categoryId);
}