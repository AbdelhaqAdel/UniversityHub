

import 'package:flutter/material.dart';

import '../../../../../core/constants/constant.dart';

class HiUser extends StatelessWidget {
  const HiUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 15.0, vertical: 15),
        child: Row(
          children: [
            _Name(),
            SizedBox(
              width: 15,
            ),
            _Image(),
          ],
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Text(
            'Hi, ${loginEntity?.displayName} !',
            maxLines: 1,
            overflow:
            TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 22),

          ),
          Text(
            'Your Dashboard.',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: const Stack(
        alignment:
        AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage(
                'assets/images/avatar1.png'),
          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              radius: 8,
              backgroundColor:
              true
                  ? Colors.green
                  : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
