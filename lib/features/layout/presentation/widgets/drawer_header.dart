import 'package:flutter/material.dart';

import '../../../../core/constants/constant.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 80,
          child: CircleAvatar(
            radius: 75.0,
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage(
              'assets/images/profile.png',
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          role == 'Student'?
          '${loginEntity!.displayName}':
          'Hi, Dr ${loginEntity!.displayName}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(.8),
          ),
        ),
      ],
    );
  }
}
