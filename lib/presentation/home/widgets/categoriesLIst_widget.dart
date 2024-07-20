import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tabs/Home_tab/Home_tab_view_model.dart';
import 'Category_Widget.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({super.key});

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeTabViewModel>().GetCategories();
    },);
  }
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<HomeTabViewModel,HomeTabStates>(
        buildWhen: (previous, current) {
          if(current is CategoriesSuccessStates){
            return true;
          }
          return false;
        },
        listenWhen: (previous, current) {
          if(current is CategoriesLoadingStates || current is CategoriesErrorStates || current is CategoriesSuccessStates){
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if(state is CategoriesLoadingStates){
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                content: SizedBox(
                  height: 50.h,
                    child: Center(
                      child: CircularProgressIndicator(),
                    )
                ),
              );
            },);
          }if(state is CategoriesErrorStates){
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                  content: Text(state.Error)
              );
            },);
          }
          if(state is CategoriesSuccessStates){
            Navigator.pop(context);
          }
        },
      
        builder: (BuildContext context, state) {
          if(state is CategoriesSuccessStates){
            return  SizedBox(height: 288.h,

                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:state.category.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.h,
                      mainAxisSpacing: 16.w
                  ),
                  itemBuilder: (context, index) => CategoryWidget(category: state.category[index]),
                ),

            );
          }
          return  Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
