import 'package:e_commerce_route/presentation/home/tabs/view_model/Home_tab_view_model.dart';
import 'package:e_commerce_route/presentation/home/widgets/brand_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsListWidget extends StatefulWidget {
  const BrandsListWidget({super.key});

  @override
  State<BrandsListWidget> createState() => _BrandsListWidgetState();
}

class _BrandsListWidgetState extends State<BrandsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeTabViewModel>().GetBrandes();
    },);
  }
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: BlocBuilder<HomeTabViewModel,HomeTabStates>(
          buildWhen: (previous, current) {
            if(current is brandsSuccessStates || current is brandsErrorStates || current is brandsLoadingStates){
              return true;
            }
            return false;
          },
            builder: (context, state) {
              if(state is brandsErrorStates){
                return Center(child: Text(state.Error),);
              }
              if(state is brandsSuccessStates){
                return SizedBox(
                  height: 140.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => BrandWidget(brand: state.brand[index]),
                      separatorBuilder: (context, index) => SizedBox(width: 20.w,),
                      itemCount: state.brand.length
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },

        )
    );
  }
}
