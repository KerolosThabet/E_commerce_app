import 'package:e_commerce_route/core/reusable_components/product_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tabs/Home_tab/Home_tab_view_model.dart';

class MostSellingProductWidget extends StatefulWidget {
  const MostSellingProductWidget({super.key});

  @override
  State<MostSellingProductWidget> createState() => _MostSellingProductWidgetState();
}

class _MostSellingProductWidgetState extends State<MostSellingProductWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      context.read<HomeTabViewModel>().GetMostSellingProduct();
    
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
      buildWhen: (previous, current) {
        if(current is MostSellingProductSuccessStates || current is MostSellingProductErrorStates || current is MostSellingProductLoadingStates){
          return true ;
        }
        return false;
      },
        builder: (context, state) {
          if(state is MostSellingProductSuccessStates ){
            return SizedBox(
              height: 242.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductWidget(productEntity: state.products[index]),
                  separatorBuilder: (context, index) => SizedBox(width: 10.h,),
                  itemCount: state.products.length
              ),
            );
          } if (state is MostSellingProductErrorStates){
            return Text(state.Error,style:Theme.of(context).textTheme.headlineLarge,);
          }
          return Center(child: CircularProgressIndicator(),);
        },
    );
  }
}
