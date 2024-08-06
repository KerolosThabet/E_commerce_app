import 'package:e_commerce_route/core/utils/assets_manager.dart';
import 'package:e_commerce_route/presentation/home/tabs/Categories_tab/Categories_Tab.dart';
import 'package:e_commerce_route/presentation/home/tabs/Profile_tab/profile_tab.dart';
import 'package:e_commerce_route/presentation/home/tabs/Whishlist_tab/whishlist_tab.dart';
import 'package:e_commerce_route/presentation/home/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Home_ViewModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static  List<Widget>tabs=[HomeTab(),CategoriesTab(),WhishlistTab(),ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel,homeState>(
      builder: (context, state) {
        HomeViewModel homeViewModel =HomeViewModel.get(context);
        return Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset(AssetsManager.Route,height: 22.h ,width: 66.w ,),
          ),
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: homeViewModel.currentIndex,
              onTap: (newIndex) {
                homeViewModel.ChangeBottomNavIndex(newIndex);
              },

              items: [
                BottomNavigationBarItem(icon: SvgPicture.asset(AssetsManager.homeUnSelected,width: 40.w,height: 40.h,),
                    activeIcon:  SvgPicture.asset(AssetsManager.homeSelected,width: 40.w,height: 40.h,)
                    ,backgroundColor: Theme.of(context).colorScheme.primary,label: ''),
                BottomNavigationBarItem(icon: SvgPicture.asset(AssetsManager.categoriesUnSelected,width: 40.w,height: 40.h,),
                    activeIcon:  SvgPicture.asset(AssetsManager.categoriesSelected,width: 40.w,height: 40.h,)
                    ,backgroundColor: Theme.of(context).colorScheme.primary,label: ''),
                BottomNavigationBarItem(icon: SvgPicture.asset(AssetsManager.whishlistUnSelected,width: 40.w,height: 40.h,),
                    activeIcon:  SvgPicture.asset(AssetsManager.whishlistSelected,width: 40.w,height: 40.h,)
                    ,backgroundColor: Theme.of(context).colorScheme.primary,label: ''),
                BottomNavigationBarItem(icon: SvgPicture.asset(AssetsManager.profileUnSelected,width: 40.w,height: 40.h,),
                    activeIcon:  SvgPicture.asset(AssetsManager.profileSelected,width: 40.w,height: 40.h,)
                    ,backgroundColor: Theme.of(context).colorScheme.primary,label: ''),
              ]),
          body:tabs[homeViewModel.currentIndex],
        );
      },

    );
  }
}
