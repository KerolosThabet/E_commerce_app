import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/dataSource_contract/categories_dataSource.dart';
import 'package:e_commerce_route/domain/entites/CategoryEntity.dart';
import 'package:e_commerce_route/domain/repository_contracts/Categories_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:CategoriesRepo )
class CategoriesRepoImp extends CategoriesRepo {

  CategoriesDataSource apiDataSource ;
  @factoryMethod
  CategoriesRepoImp(this.apiDataSource);

  @override
  Future<Either<List<CategoryEntity>, String>> getCategories()async {
    var result = await apiDataSource.getCategories();
    return result.fold((response) {
      var categoriesListModel = response.data ?? [];
      var categories = categoriesListModel.map((Category) =>
          Category.toCategoryEntity()).toList();
      return Left(categories);
    }, (error) {
      return Right(error);
    }
    );
  }
  }


