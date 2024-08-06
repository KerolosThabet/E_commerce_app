
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_route/core/DI/di.dart';
import 'package:e_commerce_route/presentation/home/widgets/brandsList_Widget.dart';
import 'package:e_commerce_route/presentation/home/widgets/categoriesLIst_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/string_manager.dart';
import '../widgets/MostSelling_Product_Widget.dart';
import 'Home_tab/Home_tab_view_model.dart';

class HomeTab extends StatelessWidget {
   HomeTab({super.key});
static List<String> ads =[AssetsManager.ad1,AssetsManager.ad2,AssetsManager.ad3,];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt<HomeTabViewModel>(),
      child: Padding(
        padding:  REdgeInsets.all(16.0),
        child: CustomScrollView(
         slivers: [
           SliverToBoxAdapter(child: CarouselSlider.builder(
                   itemCount: 3,
                   itemBuilder: (context, index, realIndex) => Image.asset(ads[index]),
                   options: CarouselOptions(
                     autoPlay: true,
                     enlargeCenterPage:true,
                     height: 200.h,
                   )
               ),),
           SliverToBoxAdapter(child:SizedBox(height: 25.h,),),
           SliverToBoxAdapter(child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(StringManager.categories,
                 style: Theme.of(context).textTheme.headlineLarge,),
               Text(StringManager.viewAll,
                   style: Theme.of(context).textTheme.headlineLarge
                       ?.copyWith(fontSize:12.sp,fontWeight: FontWeight.w400)),

             ],
           ),),
           SliverToBoxAdapter(child:SizedBox(height: 16.h,),),
           CategoriesListWidget(),
           SliverToBoxAdapter(child:SizedBox(height: 25.h,),),
           SliverToBoxAdapter(child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(StringManager.brands,
                 style: Theme.of(context).textTheme.headlineLarge,),
               Text(StringManager.viewAll,
                   style: Theme.of(context).textTheme.headlineLarge
                       ?.copyWith(fontSize:12.sp,fontWeight: FontWeight.w400)),

             ],
           ),),
           SliverToBoxAdapter(child:SizedBox(height: 16.h,),),
           SliverToBoxAdapter(child: BrandsListWidget()),
           SliverToBoxAdapter(child:SizedBox(height: 25.h,),),
           SliverToBoxAdapter(child:
               Text(StringManager.MostSellingProduct,
                 style: Theme.of(context).textTheme.headlineLarge,)
           ),
           SliverToBoxAdapter(child:SizedBox(height: 16.h,),),
           SliverToBoxAdapter( child: MostSellingProductWidget(),)

         ],
        ),
      ),
    );
  }
}
