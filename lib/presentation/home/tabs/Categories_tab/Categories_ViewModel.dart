import 'package:e_commerce_route/domain/usecases/Categories_Usecase.dart';
import 'package:e_commerce_route/domain/usecases/SubCategoreis_UseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entites/CategoryEntity.dart';
import '../../../../domain/entites/SubcategoryEntity.dart';

@injectable
class CategoriesViewmodel extends Cubit<CategoriesState>{
  @factoryMethod
  CategoriesViewmodel(this.categoriesUseCase,this.subCategoriesUseCase):super(CategoriesScreenInitialState());
  static  CategoriesViewmodel get(context)=>BlocProvider.of(context);

CategoriesUseCase categoriesUseCase ;
SubCategoriesUseCase subCategoriesUseCase;
 getCategories() async {
   emit(CategoriesScreenLoadingState());
   var result = await categoriesUseCase.Call();
   result.fold(
           (categories){
emit(CategoriesScreenSuccessState(categories));
           }, (Error){
emit(CategoriesScreenErrorState(Error));
   });
 }

 getSubCategories(String categoryId)async{
   emit(SubCategoriesLoadingState());
  var result =await subCategoriesUseCase.Call(categoryId);
  result.fold(
          (Subcategories){
            emit(SubCategoriesSuccessState(Subcategories));
          }, (Error){
            emit(SubCategoriesErrorState(Error));
  });
 }
}

abstract class CategoriesState {}
class CategoriesScreenInitialState extends CategoriesState {}
class CategoriesScreenLoadingState extends CategoriesState {}
class CategoriesScreenSuccessState extends CategoriesState {
  List<CategoryEntity> categories ;
  CategoriesScreenSuccessState(this.categories);
}
class CategoriesScreenErrorState extends CategoriesState {
  String Error;
  CategoriesScreenErrorState(this.Error);
}

class SubCategoriesLoadingState extends CategoriesState {}
class SubCategoriesSuccessState extends CategoriesState {
  List<SubcategoryEntity> Subcategories ;
  SubCategoriesSuccessState(this.Subcategories);
}
class SubCategoriesErrorState extends CategoriesState {
  String Error;
  SubCategoriesErrorState(this.Error);
}