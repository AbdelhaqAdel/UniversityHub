
import 'package:flutter/material.dart';


class PendingStates extends StatelessWidget {
  const PendingStates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(.6),
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(width: .5),
              ),
              child: const Center(
                child: Text(
                  'Available',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
