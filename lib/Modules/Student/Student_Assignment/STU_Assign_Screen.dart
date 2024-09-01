
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universityhup/Models/STU_Model/CourseModel/stuAssignAdapter/STU_Course_Assign_Model.dart';

import 'package:universityhup/Modules/Student/Student_Assignment/STU_About_Assign_Screen.dart';

import 'package:universityhup/Shared/Component/component.dart';
import 'package:universityhup/Shared/Cons_widget.dart';
import 'package:universityhup/Shared/Cubit/App_cubit.dart';
import 'package:universityhup/Shared/Cubit/App_state.dart';
import 'package:universityhup/Shared/constant.dart';





class STU_Assign_Screen extends StatelessWidget {
  const STU_Assign_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_cubit, App_state>(
      listener: (context, state) {},
      builder: (context, state) {
        App_cubit cubit=App_cubit.get(context);
        List<STU_Course_Assign_Model>assign=cubit.stuCoursesAssign_Pending_Model;
        List<File> all_files=cubit.all_assign_files_List;
        return DefaultTabController(
          length: 2, // Number of tabs
          initialIndex: cubit.Tab_Bar_3_index,
          child: Scaffold(
            body: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    defaultAppbar(
                        text: cubit.currentCourseName,
                        context:context),
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        // height: 200,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const RadialGradient(
                            radius: 1.1,
                            center: Alignment.topRight,
                            colors: [
                              Colors.blue,
                              Colors.indigo
                              //HexColor('051875FF'),
                            ],
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'You are a super warrior !',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          FontAwesomeIcons.check,
                                          size: 14,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${ cubit.stuCoursesAssign_Completed_Model.length} tasks Completed',
                                        style: TextStyle(
                                            color: Colors.grey[300], fontSize: 14,fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          FontAwesomeIcons.check,
                                          size: 14,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${ cubit.stuCoursesAssign_Pending_Model.length} tasks Running',
                                        style: TextStyle(
                                            color: Colors.grey[300], fontSize: 14,fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),

                                ],
                              ),
                              //Spacer(),
                              const Expanded(
                                child: Image(
                                  height: 120,
                                  width: 120,
                                  image: AssetImage('assets/images/R.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
          

                    TabBar(
                      onTap: (index) {
                        cubit.Tab_Bar_3_Function(index: index);
                      },
                      indicatorColor:
                      cubit.Tab_Bar_3_index == 0 ? Colors.red : Colors.teal,
                      indicatorWeight: 5,
                      splashBorderRadius: BorderRadius.circular(25),
                      indicatorSize: TabBarIndicatorSize.label,
                      splashFactory: NoSplash.splashFactory,
                      tabs: [
                        Tab(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.clock,
                                color: cubit.Tab_Bar_3_index == 0
                                    ? Colors.red
                                    : Colors.black.withOpacity(.6),
                                size: cubit.Tab_Bar_3_index == 0 ? 25 : 22,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Pending',
                                style: TextStyle(
                                  fontSize: cubit.Tab_Bar_3_index == 0 ? 20 : 18,
                                  color: cubit.Tab_Bar_3_index == 0
                                      ? Colors.red
                                      : Colors.black.withOpacity(.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.circleCheck,
                                color: cubit.Tab_Bar_3_index == 1
                                    ? Colors.teal
                                    : Colors.black.withOpacity(.6),
                                size: cubit.Tab_Bar_3_index == 1 ? 25 : 22,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Complete',
                                style: TextStyle(
                                  fontSize: cubit.Tab_Bar_3_index == 1 ? 20 : 18,
                                  color: cubit.Tab_Bar_3_index == 1
                                      ? Colors.teal
                                      : Colors.black.withOpacity(.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ConditionalBuilder(condition: cubit.Tab_Bar_3_index == 0,
                        builder: (context) =>Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            height: 500,
                            child: ConditionalBuilder(
                              condition: assign.isNotEmpty&&state is !Stu_Get_Course_Assign_LoadingState,
                              builder:(context)=> ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder:(context,index)=>InkWell(
                                    onTap: (){
                                      cubit.assignName=assign[index].taskName;
                                      cubit.assignFile=null;
                                      cubit.taskId=assign[index].taskId;
                                      cubit.all_assign_files_List=[];
                                      cubit.StuGetAssignData();
                                      showDialog<String>(
                                        context: context,
                                        barrierColor: Colors.black.withOpacity(.3),
                                        useSafeArea: true,
                                        builder: (BuildContext context) => AlertDialog(
                                          insetPadding: const EdgeInsets.all(0.0),
                                          scrollable: false,
                                          shadowColor: Colors.transparent,
                                          content: Center(
                                            child: Container(
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
                                                              padding: const EdgeInsets.all(15.0),
                                                              child: GlassBoxWithBorder(
                                                                widget: Container(
                                                                  height: 180,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom: 25.0,
                                                                        left: 25,
                                                                        right: 25,
                                                                        top: 20
                                                                    ),
                                                                    child: Form(
                                                                      key: formkey1,
                                                                      child: Column(
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              FaIcon(FontAwesomeIcons.bookmark,size: 25,),
                                                                              SizedBox(width: 15,),
                                                                              Text(
                                                                                '${ cubit.stuAssignDataModel?.taskName??'Task Name'}',
                                                                                maxLines: 2,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style:
                                                                                Theme.of(context)
                                                                                    .textTheme
                                                                                    .bodyMedium?.copyWith(fontSize: 15,color: Colors.black),

                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height: 15,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              FaIcon(FontAwesomeIcons.chartSimple,size: 25,),
                                                                              SizedBox(width: 15,),
                                                                              Text(
                                                                                '${cubit.stuAssignDataModel?.taskGrade}   Points',
                                                                                maxLines: 2,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style:
                                                                                Theme.of(context)
                                                                                    .textTheme
                                                                                    .bodyMedium?.copyWith(fontSize: 15,color: Colors.black),

                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height: 15,
                                                                          ),
                                                                          Spacer(),
                                                                          Container(
                                                                            height: 50,
                                                                            child: Row(
                                                                              children: [
                                                                                Expanded(
                                                                                    child:
                                                                                    Default_Button(
                                                                                      color:  Colors.teal.withOpacity(.7),
                                                                                      textFontSize:
                                                                                      20,
                                                                                      onPressed: () {

                                                                                        cubit.openFile_Fun(networkFile:cubit.stuAssignDataModel?.filePath );
                                                                                      },
                                                                                      text:
                                                                                      'Open Task',
                                                                                    )),
                                                                                SizedBox(
                                                                                  width: 15,
                                                                                ),
                                                                                GestureDetector(
                                                                                  onTap: (){
                                                                                    if(cubit.all_assign_files_List.isEmpty) {
                                                                                      cubit.pick_File();
                                                                                    }
                                                                                    else {
                                                                                      cubit.SumitTask();
                                                                                      Navigator.pop(context);
                                                                                    }

                                                                                  },
                                                                                  child: cubit.all_assign_files_List.isEmpty?
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.red.withOpacity(.7),
                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(10.0),
                                                                                      child: const Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Icon(Icons.file_present_rounded,color: Colors.white,),
                                                                                          SizedBox(
                                                                                            width: 5,),
                                                                                          Text(
                                                                                            'Attach File' ,//: 'Done',
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontSize: 20,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ): const Text(
                                                                                    'Done' ,//: 'Done',
                                                                                    style: TextStyle(
                                                                                      color: Colors.teal,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontSize: 20,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),

                                                                          // SizedBox(
                                                                          //   height: 15,
                                                                          // ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                color: Colors.white
                                                                    .withOpacity(.5),
                                                                borderRadius: 30,
                                                                x: 15,
                                                                y: 15,
                                                                BorderWidth: 1,
                                                                BorderColor: Colors.white,
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
                                                    x: 3,
                                                    y: 3),
                                              ),
                                            ),
                                          ),
                                          elevation: 0,
                                          clipBehavior: Clip.none,
                                          surfaceTintColor: Colors.transparent,
                                          backgroundColor: Colors.transparent,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      );
                                      // navigateTo(context,STU_About_Assign_Screen() );
                                    },
                                    child: STU_pend_Tasks(assign:cubit.stuCoursesAssign_Pending_Model[index] ,context: context)),
                                separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                                itemCount: cubit.stuCoursesAssign_Pending_Model.length,
                              ),
                              fallback:(context)=> Center(child: CircularProgressIndicator(),),
                            ),
                          ),
                        ) ,
                        fallback: (context) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            height:500,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder:(context,index)=>InkWell(
                                  onTap: (){
                                    // navigateTo(context,STU_Assign_Screen() );
                                  },
                                  child: STU_complete_Tasks(assign: cubit.stuCoursesAssign_Completed_Model[index],context: context)),
                              separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                              itemCount: cubit.stuCoursesAssign_Completed_Model.length,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              
            ),
          ),
        );
      },
    );
  }
}
