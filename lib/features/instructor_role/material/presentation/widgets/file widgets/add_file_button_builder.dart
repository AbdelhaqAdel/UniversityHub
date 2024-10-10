import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universityhup/core/style/colors.dart';
import 'package:universityhup/core/widgets/custom_button.dart';
import 'package:universityhup/features/instructor_role/material/presentation/manager/cubit/material_cubit.dart';
import 'package:universityhup/features/instructor_role/material/presentation/widgets/file%20widgets/file_widget.dart';

class AddFileButtonBuilder extends StatelessWidget {
  const AddFileButtonBuilder({super.key, required this.onTap});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
        var screenSize = MediaQuery.sizeOf(context);
    return BlocBuilder<InsMaterialCubit, MaterialsState>(
      builder: (context,state ){
        if(state is PickFileSuccessState){
            return  Column(
              children: [
               const SmallFileWidget(),
               const SizedBox(height: 10,),
                CustomButton(
                     onTap: () {
                      onTap();
               },
                height: screenSize.height /17,
                color: KColors.buttonColor,
                fontSize: 20.sp,
                text:'Done'
                ),
              ],
            );
                     }else if(state is AddMaterialLoadingState){
                     return const Column(
              children: [
               SmallFileWidget(),
             SizedBox(height: 10,),
             Center(child: CircularProgressIndicator())
              ],
            );
                     }else{
                      return  Column(
                        children: [
                          CustomButton(
                        onTap: () {
                          onTap();},
                         height: screenSize.height /17,
                         color: KColors.buttonColor,
                         fontSize: 20.sp,
                         text:'add'
                         ),
                        ],
                      );
        }
      }
      
    );
  }
}