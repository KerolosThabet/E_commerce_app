import 'package:e_commerce_route/core/DI/di.dart';
import 'package:e_commerce_route/presentation/home/widgets/SubCategory_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../widgets/Categories_selection_widget.dart';
import 'Categories_ViewModel.dart';

class CategoriesTab extends StatefulWidget {

    CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int selected = 1 ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<CategoriesViewmodel>()..getCategories(),
      child: BlocBuilder<CategoriesViewmodel,CategoriesState>(
        buildWhen: (previous, current) {
          if(current is CategoriesScreenLoadingState ||
              current is CategoriesScreenErrorState ||
              current is CategoriesScreenSuccessState ){
            return true ;
          }
          return false;
        },
        builder: (context, state) {
          if(state is CategoriesScreenSuccessState){
            return   Padding(
              padding:  REdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 137.w,
                    decoration: BoxDecoration( color: ColorsManager.CategoriesListBackgrond.withOpacity(.5)
                        ,borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(width: 2.w , color:ColorsManager.primaryColor.withOpacity(.4) )
                    ),
                    child: ListView.separated(
                        itemBuilder: (context, index) => CategoriesSelectionWidget(
                          selectedCategory: (){
                            selected=index;
                            setState(() {
                              CategoriesViewmodel.get(context).getSubCategories(state.categories[selected].id??'');
                            });
                          },
                          categoryEntity:state.categories[index],
                          isSelected: index==selected ,
                        ),
                        separatorBuilder:(context, index) =>  SizedBox(height: 10.h,),
                        itemCount: state.categories.length
                    ),
                  ),
                  Expanded(
                      child:BlocConsumer<CategoriesViewmodel,CategoriesState>(
                        listener: (context, state) {
                         if(state is CategoriesScreenSuccessState){
                           context.read<CategoriesViewmodel>().getSubCategories(state.categories[selected].id??'');
                         }
                        },
                         buildWhen: (previous, current) {
                           if (current is SubCategoriesSuccessState ||
                               current is SubCategoriesLoadingState ||
                               current is SubCategoriesErrorState ){
                             return true ;
                           }
                           return false;
                         },
                        builder: (context, state) {
                           if(state is SubCategoriesSuccessState){
                             return GridView.builder(
                               itemCount: state.Subcategories.length,
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                     crossAxisCount: 3,childAspectRatio: 1/2 ,
                                     crossAxisSpacing: 13.w ,mainAxisSpacing: 16.h
                                 ),
                                 itemBuilder: (context, index) => SubcategoryWidget(state.Subcategories[index]),
                             );
                           } if (state is SubCategoriesErrorState){
                             return Center( child:  Text(state.Error),);
                           }
                           return Center(child: CircularProgressIndicator(),);
                      },)
                  )
                ],
              ),
            );
          }if (state is CategoriesScreenErrorState){
            return Center(
              child:Text(state.Error,style: Theme.of(context).textTheme.headlineLarge ,)
              ,);
          }
          return Center( child: CircularProgressIndicator(),);
        },

      ),
    );
  }
}
