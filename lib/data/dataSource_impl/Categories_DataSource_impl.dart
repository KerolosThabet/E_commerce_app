import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/api/EndPoints.dart';
import 'package:e_commerce_route/core/api/api_manager.dart';
import 'package:e_commerce_route/data/dataSource_contract/categories_dataSource.dart';
import 'package:e_commerce_route/data/model/categories_response/CategoriesResponse.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl extends CategoriesDataSource {
   ApiManager apiManager ;
   @factoryMethod
  CategoriesDataSourceImpl(this.apiManager);
  @override

 Future<Either<CategoriesResponse, String>> getCategories() async {
    try{
      var response = await apiManager.getRequest(endPoint: EndPoint.categoriesEndPoint);
      CategoriesResponse categoriesResponse =CategoriesResponse.fromJson(response.data);
      return Left(categoriesResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}