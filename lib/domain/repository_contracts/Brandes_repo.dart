import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/entites/BrandEntity.dart';

abstract class BrandesRepo{
  Future<Either<List<BrandEntity>,String>> getBrands() ;
}