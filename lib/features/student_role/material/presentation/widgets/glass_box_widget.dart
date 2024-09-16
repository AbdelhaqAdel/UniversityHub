// import 'dart:ui';

// import 'package:flutter/widgets.dart';

// class GlassBox extends StatelessWidget {
//   const GlassBox({
//   required this.widget,
//   required this.color,
//   required this.borderRadius,
//   required this.x,
//   required this.y,
//     super.key});
//   final Widget widget;
//   final Color color;
//   final double borderRadius;
//   final double x;
//   final double y;

//   @override
//   Widget build(BuildContext context) {
//     return  ClipRRect(
//       borderRadius: BorderRadius.circular(borderRadius),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(
//           sigmaY: y,
//           sigmaX: x,
//           tileMode: TileMode.clamp,
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(borderRadius),
//             // border: Border.all(color: c5!.withOpacity(.5),style: BorderStyle.solid,width: 1),
//           ),
//           child: widget,
//         ),
//       ),
//     );
//   }
// }
