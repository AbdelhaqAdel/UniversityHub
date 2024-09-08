import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/courses/data/models/all_courses_model.dart';
import 'package:universityhup/features/courses/data/repositories/courses_repo_impl.dart';
part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit({required this.coursesRepo}) : super(CoursesInitial());
  static CoursesCubit get(context) => BlocProvider.of(context);
  final CoursesRepository coursesRepo; 
  Future<void>fetchAllCourses()async{
    emit(GetAllCoursesLoadingState());
    final resault=await coursesRepo.getAllCourses();
    resault.fold(
       (error)=>emit(GetAllCoursesErrorState(error:error.message )),
       (courses)=>emit(GetAllCoursesSuccessState(courses: courses)),

       );
  }
}
