import 'package:e_commerce_route/core/DI/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../widgets/Categories_selection_widget.dart';
import 'Categories_ViewModel.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<CategoriesViewmodel>()..getCategories(),
      child: BlocBuilder<CategoriesViewmodel,CategoriesState>(
        buildWhen: (previous, current) {
          if(current is CategoriesScreenLoadingState || current is CategoriesScreenErrorState || current is CategoriesScreenSuccessState ){
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
                          categoryEntity:state.categories[index], isSelected: index==0 ,),
                        separatorBuilder:(context, index) =>  SizedBox(height: 10.h,),
                        itemCount: state.categories.length
                    ),
                  ),
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
