
import 'package:flutter/material.dart';



class CompleteTaskStates extends StatelessWidget {
  const CompleteTaskStates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(.6),
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(width: .5),
            ),
            child: const Center(
              child: Text(
                'Completed',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

