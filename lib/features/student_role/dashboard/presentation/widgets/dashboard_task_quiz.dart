import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/widgets/glass_box.dart';
import 'package:universityhup/features/student_role/dashboard/presentation/manager/dashboard_cubit.dart';



class DashboardTaskQuiz extends StatefulWidget {
  const DashboardTaskQuiz({
    super.key,
  });

  @override
  State<DashboardTaskQuiz> createState() => _DashboardTaskQuizState();
}

class _DashboardTaskQuizState extends State<DashboardTaskQuiz> {
  List<Widget> dashboardData=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if(state is GetDashboardSuccessState){
          dashboardData=GetDashboardSuccessState.dashboardWidget;
        }
      },
      builder: (context, state) {
        return Expanded(
          child: GlassBox(
            widget: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ConditionalBuilder(
                  condition:
                  dashboardData.isNotEmpty,
                  builder: (context) =>
                      CarouselSlider(
                        items: dashboardData,
                        options: CarouselOptions(
                          height: double.infinity,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval:
                          const Duration(
                              seconds: 3),
                          autoPlayAnimationDuration:
                          const Duration(
                              seconds: 1),
                          autoPlayCurve:
                          Curves.fastOutSlowIn,
                          scrollDirection:
                          Axis.horizontal,
                        ),
                      ),
                  fallback: (context) =>
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.blueGrey
                              .withOpacity(.4),
                        ),
                      ),
                )),
            color: Colors.white.withOpacity(.2),
            borderRadius: 20,
            x: 0,
            y: 0,
            border: true,),
        );
      },
    );
  }
}
