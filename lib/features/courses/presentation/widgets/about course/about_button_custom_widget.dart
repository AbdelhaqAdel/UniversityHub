import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({
    required this.text,
    required this.image,
    required this.color,
    super.key});
  final String text;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return     Expanded(
             child: InkWell(
               onTap: (){
                 // navigateTo(context,rol=='Student'? STU_Matrial_Screen():INS_Matrial_Screen() );
               },
               child: Container(
                 decoration: BoxDecoration(
                  color:color,
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                            Expanded(
                              child: Container(
                               alignment: AlignmentDirectional.center,
                               child: Image.asset(image),),
                            ),
                       Padding(
                         padding:  const EdgeInsets.only(bottom: 25.0),
                           child: Text(text,textAlign: TextAlign.center,
                             style: Theme.of(context).textTheme.titleMedium,
                           ),
     
                       ),
                     ],
                   ),
                 ),),
    );
  }
}