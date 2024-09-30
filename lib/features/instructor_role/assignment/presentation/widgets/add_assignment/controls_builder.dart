import 'package:flutter/material.dart';

class ControlsBuilder extends StatelessWidget {
  const ControlsBuilder({
    super.key, required this.details,
  });
  final ControlsDetails details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              details.onStepContinue!();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15),
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              details.onStepCancel!();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blueGrey.withOpacity(.2),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15),
                child: Text(
                  'Back',
                  style: TextStyle(
                      fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
