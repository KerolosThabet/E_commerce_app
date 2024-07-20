import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/api/api_manager.dart';
import 'package:e_commerce_route/data/dataSource_contract/product_dataSource.dart';
import 'package:e_commerce_route/data/model/products_response/ProductResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/EndPoints.dart';

@Injectable(as: ProductDataSource)
class ProductDatasourceImpl extends ProductDataSource{
  ApiManager apiManager;
  @factoryMethod
  ProductDatasourceImpl(this.apiManager);
  @override
  Future<Either<ProductResponse, String>> getProduct({String? sort}) async {
    try{
      var response = await apiManager.getRequest(endPoint: EndPoint.ProductsEndPoint,
          queryParameters: {"sort": sort});
      ProductResponse productResponse =ProductResponse.fromJson(response.data);
      return Left(productResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}