import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'background_shape.dart';
import 'blur_layer.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    super.key, required this.widget,  this.animation=false,
  });
  final Widget widget;
  final bool animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundShape(),
       animation? const RiveAnimation.asset(
          "assets/riveassets/shapes.riv",
        ):const SizedBox(),
        const BlurLayer(),
        widget,
      ],
    );
  }
}

