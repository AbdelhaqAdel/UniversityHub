import 'dart:io';

import 'package:flutter/material.dart';
import 'package:universityhup/core/style/colors.dart';

class SmallFileWidget extends StatelessWidget {
  const SmallFileWidget({super.key,});
  // final File file;
  @override
  Widget build(BuildContext context) {
    return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.blueGrey.withOpacity(.15),
    ),
    padding: const EdgeInsets.all(6),
    child: SizedBox(
      width:150 ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 2,
          ),
          Container(
            height: 80,
            width: 130,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: KColors.subTitleColor.withOpacity(.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
                'jpg',
                style:Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white), 
              ),
            ),
          
          const SizedBox(
            height:10,
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                   'Screenshot_2024-10-10-20-43-46-992_com.whatsapp.jpg',
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines:1,
                  ),
      
                ],
              ),
            ),
          ),
         
         ]),
    )
    );
  }
}