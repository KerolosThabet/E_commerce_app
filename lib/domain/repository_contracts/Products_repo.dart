import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/entites/ProductEntity.dart';

abstract class ProductRepo{
 Future<Either<List<ProductEntity>,String>> getProducts({String? sort});
}