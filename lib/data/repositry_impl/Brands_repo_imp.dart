import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/dataSource_contract/brandes_dataSource.dart';
import 'package:e_commerce_route/domain/entites/BrandEntity.dart';
import 'package:e_commerce_route/domain/repository_contracts/Brandes_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandesRepo)
class BrandsRepoImp extends BrandesRepo {
  BrandsDatasource ApiDatasource;
  @factoryMethod
  BrandsRepoImp(this.ApiDatasource);
  @override
  Future<Either<List<BrandEntity>, String>> getBrands() async {
    var result = await ApiDatasource.getBrandes();
    return result.fold((response) {
      var brandsListModel = response.data ?? [];
      var brands = brandsListModel.map((brand) => brand.toBrandEntity()).toList();
      return Left(brands);
    }, (error) {
      return Right(error);
    }
    );
  }

}