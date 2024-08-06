import 'package:e_commerce_route/core/utils/assets_manager.dart';
import 'package:e_commerce_route/domain/entites/SubcategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SubcategoryWidget extends StatelessWidget {
   SubcategoryWidget(this.subcategoryEntity,{super.key});
  SubcategoryEntity subcategoryEntity ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(5.r),
            color: Theme.of(context).colorScheme.primary
          ),
          child: SvgPicture.asset(
            AssetsManager.Route,
             colorFilter: ColorFilter.mode( Colors.white, BlendMode.srcIn),
          ),
        ),
        SizedBox(height: 8.h,),
        Text(
    subcategoryEntity.name??'',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 12.sp , fontWeight: FontWeight.w400
        ),
    )
      ],
    );
  }
}
