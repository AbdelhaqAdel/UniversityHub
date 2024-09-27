import 'package:flutter/material.dart';
import '../../../../../core/widgets/glass_box.dart';
import '../../domain/entities/user_entity.dart';

class ButtonsActions extends StatelessWidget {
  const ButtonsActions({
    super.key,
    required this.userEntity,
  });

  final UserInstructorEntity? userEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
              },
              child: GlassBox(
                widget: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Edit account',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                color: Colors.blueGrey.withOpacity(.15),
                borderRadius: 10,
                x: 30,
                y: 30, border: false,),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: GlassBox(
              widget: Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
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
                                      Padding(
                                        padding:
                                        const EdgeInsets.all(
                                            15.0),
                                        child:
                                        GlassBox(
                                          widget: Padding(
                                            padding:
                                            const EdgeInsets
                                                .all(15.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  userEntity!.facultyName!,
                                                  style:
                                                  const TextStyle(
                                                    fontWeight:
                                                    FontWeight
                                                        .w900,
                                                    fontSize: 15,
                                                    color:Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    _CardImage(),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    _CardInfo(userEntity: userEntity),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          color: Colors.white
                                              .withOpacity(.5),
                                          borderRadius: 20,
                                          x: 18,
                                          y: 18,
                                          border: true,
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
                    alignment: Alignment.center,
                    child: const Text(
                      'Show your card',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color:Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              color: Colors.blueGrey.withOpacity(.15),
              borderRadius: 10,
              x: 30,
              y: 30, border: false,),
          ),
        ],
      ),
    );
  }
}

class _CardInfo extends StatelessWidget {
  const _CardInfo({
    super.key,
    required this.userEntity,
  });

  final UserInstructorEntity? userEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment
          .start,
      children: [
        Row(
          children: [
            const Text(
              'Name : ',
              style:
              TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                color: Colors.teal,
              ),
            ),
            SizedBox(
              width:
              130,
              child:
              Text(
                userEntity!.fullName!,
                maxLines: 1,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color:Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height:
          4,
        ),
        Row(
          children: [
            const Text(
              'university : ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
              TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                color: Colors.teal,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*.3,
              child: Text(
               userEntity!.universityName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color:Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height:
          4,
        ),
        Row(
          children: [
            const Text(
              'email : ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
              TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                color: Colors.teal,
              ),
            ),
            Text(
              userEntity!.email!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
              const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color:Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height:
          4,
        ),
        Row(
          children: [
            const Text(
              'Number : ',
              style:
              TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                color: Colors.teal,
              ),
            ),
            Text(
              userEntity!.phone!,
              maxLines:
              1,
              style:
              const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color:Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height:
          4,
        ),
      ],
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape
              .circle,
          boxShadow: [
            BoxShadow(
              color:
              Colors.black,
              blurRadius:
              0,
              spreadRadius:
              1,
            ),
          ]),
      child:
      const CircleAvatar(
        radius:
        50,
        backgroundImage:
        AssetImage(
          'assets/images/profile.png',
        ),
      ),
    );
  }
}
