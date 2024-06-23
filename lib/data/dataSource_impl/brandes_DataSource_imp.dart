import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/api/api_manager.dart';
import 'package:e_commerce_route/data/dataSource_contract/brandes_dataSource.dart';
import 'package:e_commerce_route/data/model/brands_response/BrandesResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/EndPoints.dart';

@Injectable(as: BrandesDatasource)
class BrandesDatasourceImp extends BrandesDatasource {
  ApiManager apiManager;
  @factoryMethod
  BrandesDatasourceImp(this.apiManager);

  @override
  Future<Either<BrandesResponse, String>> getBrandes() async {
    try{
      var response = await apiManager.getRequest(endPoint: EndPoint.brandesEndPoint);
      BrandesResponse brandesResponse =BrandesResponse.fromJson(response.data);
      return Left(brandesResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}