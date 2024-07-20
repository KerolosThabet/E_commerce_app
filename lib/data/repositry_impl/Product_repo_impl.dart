import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/dataSource_contract/product_dataSource.dart';
import 'package:e_commerce_route/domain/entites/ProductEntity.dart';
import 'package:e_commerce_route/domain/repository_contracts/Products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ProductRepo )
class ProductRepoImpl extends ProductRepo{
  ProductDataSource apiDataSource ;

  @factoryMethod
  ProductRepoImpl(this.apiDataSource);

  @override
  Future<Either<List<ProductEntity>, String>> getProducts({String? sort}) async{
    var result = await apiDataSource.getProduct(sort: sort);
    return result.fold((response) {
      var productListModel = response.data ?? [];
      var product = productListModel.map((product) => product.toProductEntity() ).toList();
      return Left(product);
    }, (error) {
      return Right(error);
    }
    );
  }

}