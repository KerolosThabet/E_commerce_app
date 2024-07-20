import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/dataSource_contract/product_dataSource.dart';
import 'package:e_commerce_route/domain/repository_contracts/Products_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/ProductEntity.dart';

@injectable
class MostSellingProductUseCase{
  ProductRepo productRepo ;
  @factoryMethod
  MostSellingProductUseCase(this.productRepo);

  Future<Either<List<ProductEntity>, String>> call()=>productRepo.getProducts(
      sort: ProductSorting.MostSelling.sort
  );
}