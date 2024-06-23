import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/repository_contracts/Categories_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/CategoryEntity.dart';
@injectable
class CategoriesUseCase {
 CategoriesRepo categoriesRepo ;
 @factoryMethod
  CategoriesUseCase(this.categoriesRepo);

 Future<Either<List<CategoryEntity>, String>> Call(){
    return categoriesRepo.getCategories();
  }
}