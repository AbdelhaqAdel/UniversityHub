
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:universityhup/core/widgets/glass_box.dart';

import '../../../../../core/functions/dashboard_data.dart';



class DashboardInstructorNews extends StatelessWidget {
  const DashboardInstructorNews({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GlassBox(
        widget: SizedBox(
          width: double.infinity,
          height: double.infinity,
          //allNEWSFromHIVE
          child:  CarouselSlider(
            items: newsList,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval:
              const Duration(seconds: 3),
              autoPlayAnimationDuration:
              const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        borderRadius: 20,
        x: 0,
        y: 0, border: true, color: Colors.white.withOpacity(.2),),
    );
  }
}
