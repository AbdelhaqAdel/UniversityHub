import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/glass_box.dart';

class IsVerify extends StatelessWidget {
  const IsVerify({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: true,
        builder: (context) => Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlassBox(
                widget: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Verify your account',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Send',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.teal[300],
                            ),
                          )),
                      IconButton(
                          onPressed: () {
                            // cubit.verfiy_Function();
                            // print(FirebaseAuth.instance
                            //     .currentUserInstructor?.emailVerified);
                          },
                          icon: const Icon(
                            Icons.restart_alt,
                            color:Colors.black,
                          )),
                    ],
                  ),
                ),
                color: Colors.blueGrey.withOpacity(.1),
                borderRadius: 12,
                x: 40,
                y: 40,
                border: false,
              ),
            ),
          ],
        ),
        fallback: (context) => const SizedBox(
          height: 0,
        ));
  }
}
