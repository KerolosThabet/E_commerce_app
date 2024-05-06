import 'package:e_commerce_route/core/api/EndPoints.dart';
import 'package:e_commerce_route/core/api/api_manager.dart';
import 'package:e_commerce_route/data/dataSource_contract/categories_dataSource.dart';
import 'package:e_commerce_route/data/model/categories_response/CategoriesResponse.dart';

import '../../core/api/api_manager.dart';

class CategoriesDataSourceImpl extends CategoriesDataSource {
   ApiManager apiManager ;
  CategoriesDataSourceImpl(this.apiManager);
  @override

  Future<CategoriesResponse?> getCategories() async {
    try{
      var response = await apiManager.getRequest(endPoint: EndPoint.categoriesEndPoint);
      CategoriesResponse categoriesResponse =CategoriesResponse.fromJson(response.data);
      return categoriesResponse;
    }catch(error){

    }
  }

}