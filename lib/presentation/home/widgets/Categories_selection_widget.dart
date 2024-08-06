import 'package:e_commerce_route/domain/entites/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef SelectedCategory = void Function();
class CategoriesSelectionWidget extends StatelessWidget {
  CategoryEntity categoryEntity ;
  bool isSelected ;
  SelectedCategory selectedCategory ;
   CategoriesSelectionWidget({super.key,required this.selectedCategory, required this.categoryEntity,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedCategory();
      },
      child: Container(
        height: 72.h,
       decoration: BoxDecoration(color: isSelected ? Colors.white :Colors.transparent,
       borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding:  REdgeInsets.all(5.0),
          child: Row(
            children: [
              Visibility(
                visible: isSelected,
                child: Container(
                  width: 8.w ,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
              SizedBox(width: 5.w,),
              Text(categoryEntity.name??'',style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w500, fontSize: 14.sp
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
