import 'package:flutter/material.dart';
import '../../../../../core/widgets/glass_box.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () => showDialog<String>(
              context: context,
              barrierColor: Colors.black.withOpacity(.3),
              useSafeArea: true,
              builder: (BuildContext context) => AlertDialog(
                insetPadding: const EdgeInsets.all(0.0),
                scrollable: false,
                shadowColor: Colors.transparent,

                // title: const Text('AlertDialog Title'),
                content: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: GlassBox(
                        widget: Stack(
                          children: [
                            Column(
                              children: [
                                const Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  decoration:
                                  const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Padding(
                                    padding:
                                    EdgeInsets.all(10.0),
                                    child: CircleAvatar(
                                      radius: 120,
                                      backgroundColor:
                                      Colors.white,
                                      // backgroundImage: NetworkImage(
                                      //     userEntity!.imagePath!
                                      //   // 'assets/images/profile.png'
                                      // ),
                                      backgroundImage: AssetImage('assets/images/profile.png'),
                                    ),
                                  ),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        color: Colors.transparent,
                        borderRadius: 0,
                        x: 5,
                        y: 5, border: false,),
                    ),
                  ),
                ),
                elevation: 0,
                clipBehavior: Clip.none,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.white,
                //     blurRadius: 0,
                //     spreadRadius: 1,
                //   ),
                // ]
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 105,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    backgroundImage:
                    AssetImage('assets/images/profile.png'),
                    // NetworkImage('${cubit.connnection==true?cubit.studentInfoModel!
                    //     .imagePath:cubit.usermodel!.imagePath}'
                    //     // 'assets/images/profile.png'
                    //   ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
