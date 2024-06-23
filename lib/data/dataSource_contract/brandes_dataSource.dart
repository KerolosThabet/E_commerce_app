import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/model/brands_response/BrandesResponse.dart';

abstract class BrandesDatasource {
  Future<Either<BrandesResponse,String>> getBrandes();
}