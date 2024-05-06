
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/assets_manager.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
static List<String> ads =[AssetsManager.ad1,AssetsManager.ad2,AssetsManager.ad3,];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(16.0),
      child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) => Image.asset(ads[index]),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage:true,
                height: 200.h,
              )
          )
        ],
      ),
    );
  }
}
