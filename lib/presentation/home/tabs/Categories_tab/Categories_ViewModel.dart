import 'package:e_commerce_route/domain/usecases/Categories_Usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entites/CategoryEntity.dart';

@injectable
class CategoriesViewmodel extends Cubit<CategoriesState>{
  @factoryMethod
  CategoriesViewmodel(this.categoriesUseCase):super(CategoriesScreenInitialState());
  static  CategoriesViewmodel get(context)=>BlocProvider.of(context);

CategoriesUseCase categoriesUseCase ;

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