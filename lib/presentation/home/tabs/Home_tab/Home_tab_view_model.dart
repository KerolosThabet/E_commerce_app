import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/entites/ProductEntity.dart';
import 'package:e_commerce_route/domain/usecases/Categories_Usecase.dart';
import 'package:e_commerce_route/domain/usecases/Most_Selling_product_UseCase.dart';
import 'package:e_commerce_route/domain/usecases/brands_Usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entites/BrandEntity.dart';
import '../../../../domain/entites/CategoryEntity.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  @factoryMethod
  HomeTabViewModel(this.categoriesUseCase,this.brandsUseCase, this.mostSellingProductUseCase):super(HomeTabInitialStates());
 CategoriesUseCase categoriesUseCase;
BrandsUseCase brandsUseCase ;
MostSellingProductUseCase mostSellingProductUseCase;

  GetCategories() async {
   emit(CategoriesLoadingStates());
   var result = await categoriesUseCase.Call();
   result.fold(
           (Category){
             emit(CategoriesSuccessStates(Category));
           },
           (Error){
             emit(CategoriesErrorStates(Error));
           }
   );
 }

 GetBrandes()async{
emit(brandsLoadingStates());
  var result = await brandsUseCase.Call();
  result.fold(
          (brand){
            emit(brandsSuccessStates(brand));
  }, (Error){
            emit(brandsErrorStates(Error));
  });

 }

 GetMostSellingProduct()async{
    emit(MostSellingProductLoadingStates());
    var result = await mostSellingProductUseCase.call();
    result.fold(
            (MostSellingProduct){
              emit(MostSellingProductSuccessStates(MostSellingProduct));
            },
            (Error){
              emit(MostSellingProductErrorStates(Error));
            });
 }
}

abstract class HomeTabStates{}
class HomeTabInitialStates extends HomeTabStates {}
class CategoriesLoadingStates extends HomeTabStates {}
class CategoriesSuccessStates extends HomeTabStates {
  List<CategoryEntity> category ;
  CategoriesSuccessStates(this.category);
}
class CategoriesErrorStates extends HomeTabStates {
String Error;
CategoriesErrorStates(this.Error);
}

class brandsLoadingStates extends HomeTabStates{}
class brandsSuccessStates extends HomeTabStates{
  List<BrandEntity> brand ;
  brandsSuccessStates(this.brand);
}
class brandsErrorStates extends HomeTabStates{
  String Error ;
  brandsErrorStates(this.Error);
}

class MostSellingProductLoadingStates extends HomeTabStates{}
class MostSellingProductSuccessStates extends HomeTabStates{
  List<ProductEntity> products;
  MostSellingProductSuccessStates(this.products);
}
class MostSellingProductErrorStates extends HomeTabStates{
  String Error;
  MostSellingProductErrorStates(this.Error);
}