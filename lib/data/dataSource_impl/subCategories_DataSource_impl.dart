import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/api/EndPoints.dart';
import 'package:e_commerce_route/core/api/api_manager.dart';
import 'package:e_commerce_route/data/dataSource_contract/subCategory_dataSource.dart';
import 'package:e_commerce_route/data/model/SubCategory_response/SubCategoryResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:SubcategoryDatasource )
class SubcategoriesDatasourceImpl extends SubcategoryDatasource {
  ApiManager apiManager ;
  @factoryMethod
  SubcategoriesDatasourceImpl(this.apiManager);
  @override
  Future<Either<SubCategoryResponse, String>> getSubcategoryDatasource(String categoryId) async {
    try{
      var response = await apiManager.getRequest(endPoint: EndPoint.SubCategoryEndPoint(categoryId));
      return left(SubCategoryResponse.fromJson(response.data)) ;
    }catch(Error){
      return right(Error.toString());
    }
  }

}