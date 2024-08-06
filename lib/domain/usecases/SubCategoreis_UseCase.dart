import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/repository_contracts/SubCategoreis_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/SubcategoryEntity.dart';

@injectable
class SubCategoriesUseCase {
  SubCategoriesRepo subCategoriesRepo ;
  @factoryMethod
  SubCategoriesUseCase(this.subCategoriesRepo);

 Future<Either<List<SubcategoryEntity>,String>> Call(String categoryId)=>subCategoriesRepo.GetSubCategories(categoryId);
}