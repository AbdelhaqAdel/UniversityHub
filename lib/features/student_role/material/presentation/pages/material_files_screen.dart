import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/widgets/app_bar.dart';
import 'package:universityhup/core/widgets/screen_path.dart';

import '../manager/cubit/material_cubit.dart';
import '../widgets/file widgets/file_builder.dart';

class MaterialFileScreen extends StatelessWidget {
  const MaterialFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaterialCubit,MaterialsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var screenSize=MediaQuery.of(context).size;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                 SizedBox(
                  height: screenSize.height * 0.03,
                ),
                DefaultAppBar(context: context),
                 SizedBox(
                  height: screenSize.height * 0.03,
                ),
                const ScreenPath(from: 'Materials',to: 'instructor',)    , 
                 SizedBox(
                 height: screenSize.height * 0.015,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: FileBuilder(),
                     
                    // child: ConditionalBuilder(
                    //   condition:
                    //   files.isNotEmpty &&
                    //       state is! Stu_Get_Course_Material_File_LoadingState,
                    //   builder: (context) => GridView.builder(
                    //       gridDelegate:
                    //           const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2,
                    //         mainAxisSpacing: 10,
                    //         crossAxisSpacing: 10,
                    //         childAspectRatio: .9,
                    //       ),
                    //       itemCount: files.length,
                    //       physics: const BouncingScrollPhysics(),
                    //       itemBuilder: (context, index) {
                    //         return InkWell(
                    //           onTap: () {
                    //             print('*************************************');
                    //             cubit.currentFileName=files[index].fileName;
                    //             print(files[index].fileName);
                    //             print(files[index].filePath?.split('net/').last);
                    //             print(files[index].filePath);
                    //             cubit.openFile_Fun(networkFile: files[index].filePath);
                    //                 // ?.split('net/').last);
                    //             print('from material ${cubit.pathPDF}');

                    //            // App_cubit.openURL('${files[index].filePath}');
                    //           //  navigateTo(context, fileVierwer(pdfUrl:cubit.pathPDF ,));
                    //             //cubit.openFile_Fun(filePath:files[index].filePath);
                    //           },
                    //           child: STU_Build_Lec_View_Widget(
                    //               index: index,
                    //               context: context,
                    //               file: files[index], //cubit.isLec!?lectures[index]:labs[index]

                    //               ),
                    //         );
                    //       }),
                    //   fallback: (context) =>  ConditionalBuilder(
                    //       condition:
                    //       cubit.MaterialLecFiles.isNotEmpty ,
                    //       builder: (context) => GridView.builder(
                    //           gridDelegate:
                    //           const SliverGridDelegateWithFixedCrossAxisCount(
                    //             crossAxisCount: 2,
                    //             mainAxisSpacing: 10,
                    //             crossAxisSpacing: 10,
                    //             childAspectRatio: .9,
                    //           ),
                    //           itemCount:  cubit.MaterialLecFiles.length,
                    //           physics: const BouncingScrollPhysics(),
                    //           itemBuilder: (context, index) {
                    //             return InkWell(
                    //               onTap: () {
                    //                   print(cubit.MaterialLecFiles[index].filePath?.split('net/').last);
                    //                   print(cubit.MaterialLecFiles[index].filePath);
                    //                   cubit.openFile_Fun(networkFile: cubit.MaterialLecFiles[index].filePath
                    //                       ?.split('net/').last);                                      print('from material ${cubit.pathPDF}');

                    //                 // App_cubit.openURL('${files[index].filePath}');
                    //                 //  navigateTo(context, fileVierwer(pdfUrl:cubit.pathPDF ,));
                    //                 //cubit.openFile_Fun(filePath:files[index].filePath);
                    //               },
                    //               child: STU_Build_Lec_View_Widget(
                    //                 index: index,
                    //                 context: context,
                    //                 file: cubit.MaterialLecFiles[index], //cubit.isLec!?lectures[index]:labs[index]

                    //               ),
                    //             );
                    //           }),
                    //       fallback: (context) =>Center(child: CircularProgressIndicator(),)
                    //   )
                    //   ),
                  
                    ),
                  ),

              ],
            ),
          ),
        );
      },
    );
  }
}
