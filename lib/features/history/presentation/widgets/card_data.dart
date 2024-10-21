import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/features/history/data/models/history_model.dart';

class CardData extends StatelessWidget {
  const CardData({super.key,required this.history});
  final HistoryModel history;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          history.historyMessage??'',
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: KColors.c1Color,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(history.materialName??'',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: KColors.c1Color,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),

                    ],
                  ),
                );
  }
}