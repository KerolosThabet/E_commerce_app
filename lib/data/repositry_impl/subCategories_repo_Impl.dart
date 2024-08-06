import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/entites/SubcategoryEntity.dart';
import 'package:e_commerce_route/domain/repository_contracts/SubCategoreis_repo.dart';
import 'package:injectable/injectable.dart';

import '../dataSource_contract/subCategory_dataSource.dart';
import '../model/products_response/SubcategoryModel.dart';

@Injectable(as: SubCategoriesRepo)
class SubCategoriesRepoImpl extends SubCategoriesRepo{
  SubcategoryDatasource apiDataSource;
  @factoryMethod
  SubCategoriesRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<SubcategoryEntity>, String>> GetSubCategories(String CategoryID) async {
   var result = await apiDataSource.getSubcategoryDatasource(CategoryID);
   return result.fold(
           (response){
            List<SubCategoryModel> SubCategoriesModelList = response.data??[];
           List<SubcategoryEntity> SubCategoriesList = SubCategoriesModelList.map((SubCategoryModel)=> SubCategoryModel.toSubcategoryEntity()).toList();
           return left(SubCategoriesList);
           }, (Error){
             return right(Error);
   });
  }


}