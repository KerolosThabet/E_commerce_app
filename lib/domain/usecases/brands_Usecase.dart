import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/entites/BrandEntity.dart';
import 'package:e_commerce_route/domain/repository_contracts/Brandes_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class BrandsUseCase{
  BrandesRepo brandesRepo ;
  @factoryMethod
  BrandsUseCase(this.brandesRepo);

  Future<Either<List<BrandEntity>, String>> Call(){
    return brandesRepo.getBrands();
  }
}