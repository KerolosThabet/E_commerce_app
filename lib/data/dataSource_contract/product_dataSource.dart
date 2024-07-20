import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/model/products_response/ProductResponse.dart';

abstract class ProductDataSource{
  Future<Either<ProductResponse,String>> getProduct({String? sort});

}
enum ProductSorting{
  MostSelling("-sort"),
  LeastSelling('sort'),
  descendingPrice("-price"),
  AscendingPrice('price');

  final String sort;
  const ProductSorting(this.sort);
}