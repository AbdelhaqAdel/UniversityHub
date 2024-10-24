import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/widgets/background.dart';
import '../../../../core/widgets/background_shape.dart';
import '../../../../core/widgets/blur_layer.dart';
import '../manager/layout_cubit/layout_cubit.dart';
import 'layout_app_bar.dart';
import 'layout_bottom_navigation_bar.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          LayoutCubit cubit = LayoutCubit.get(context);
          return BackGround(
            widget: Stack(
              children: [
                Screen(cubit: cubit),
                LayoutAppBar(
                  cubitContext: context,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(child: LayoutNavigationBar()),
                  ],
                ),
              ],
            ),animation: cubit.currentNavigationBarIndex==0 || cubit.currentNavigationBarIndex==1,
          );
        },
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.cubit,
  });

  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: cubit.navigationBarScreens[cubit.currentNavigationBarIndex],
    );
  }
}
