import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_route/core/utils/assets_manager.dart';
import 'package:e_commerce_route/domain/entites/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatelessWidget {
  ProductEntity productEntity ;
   ProductWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height:237.h ,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(.3),
          width: 2.w
        ),
         borderRadius: BorderRadius.circular(15.r),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)),
          child: CachedNetworkImage(
            width: 191.w,
            height: 128.h,
            fit: BoxFit.cover,
            imageUrl: productEntity.imageCover??'',
            placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
             errorWidget: (context, url, error) => Center(child: Icon(Icons.error),),
          ),
        ),
              SvgPicture.asset(
                AssetsManager.IconAdd,
                height: 30.h,
                width: 30.w,
              ),
            ],
          ),
          SizedBox(height: 8.h,),
          Text(
              "${productEntity.title??''}\n",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style:Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 14.sp, fontWeight: FontWeight.w700),

          ),
          SizedBox(height: 8.h,),
          Text( 'EGP ${productEntity.price}',style:Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 14.sp, fontWeight: FontWeight.w700),),
          SizedBox(height: 8.h,),
          Row(
            children: [
              Text( 'Review(${productEntity.ratingsQuantity})',style:Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 14.sp, fontWeight: FontWeight.w700),),
              SizedBox(width: 4.w,),
              SvgPicture.asset(
                AssetsManager.IconStar,
                height: 15.h,
                width: 15.w,
              ),
              SizedBox(width: 53.w,),
              SvgPicture.asset(
                AssetsManager.Iconplus,
                height: 30.h,
                width: 30.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
