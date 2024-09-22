import 'package:get_it/get_it.dart';
import 'package:universityhup/features/calender/data/data_sources/calender_remote_data_source.dart';
import 'package:universityhup/features/calender/data/repositories/calender_repo_impl.dart';
import 'package:universityhup/features/calender/domain/use_cases/add_to_calender_use_case.dart';
import 'package:universityhup/features/calender/domain/use_cases/get_calender_usecase.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_local_data_source.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_remote_datasource.dart';
import 'package:universityhup/features/courses/data/repositories/courses_repo_impl.dart';
import 'package:universityhup/features/student_role/material/data/data_sources/material_file_local_datasource.dart';
import 'package:universityhup/features/student_role/quizzes/data/data_sources/quiz_data_remote_data_Source.dart';
import 'package:universityhup/features/student_role/quizzes/domain/use_cases/submit_quiz_usecase.dart';
import 'package:universityhup/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:universityhup/features/news/data/repositories/news_repo_impl.dart';
import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';
import '../../features/news/domain/repositories/news_repo.dart';
import '../../features/student_role/assignment/data/data_sources/assignment_remote_data_source.dart';
import '../../features/student_role/assignment/data/repositories/assignment_repo_impl.dart';
import '../../features/student_role/assignment/domain/repositories/assignment_repo.dart';
import '../../features/student_role/grade/data/data_sources/grade_remote_data_source.dart';
import '../../features/student_role/grade/data/repositories/grade_repo_impl.dart';
import '../../features/student_role/grade/domain/repositories/grade_repo.dart';
import '../../features/student_role/material/data/data_sources/material_file_remote_datasource.dart';
import '../../features/student_role/material/data/data_sources/material_remote_datasource.dart';
import '../../features/student_role/material/data/repositories/material_files_repo_impl.dart';
import '../../features/student_role/material/data/repositories/material_repo_impl.dart';
import '../../features/student_role/material/domain/use_cases/material_files_usecase.dart';
import '../../features/student_role/material/domain/use_cases/material_usecase.dart';
import '../../features/student_role/quizzes/data/data_sources/quiz_remote_data_source.dart';
import '../../features/student_role/quizzes/data/repositories/quiz_data_repo_impl.dart';
import '../../features/student_role/quizzes/data/repositories/quiz_repo_impl.dart';
import '../../features/student_role/quizzes/domain/use_cases/quiz_data_use_case.dart';
import '../../features/student_role/quizzes/domain/use_cases/quiz_use_case.dart';
import '../../features/student_role/user/data/data_sources/user_remote_data_source.dart';
import '../../features/student_role/user/data/repositories/user_repo_impl.dart';
import '../../features/student_role/user/domain/repositories/user_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(loginRemoteDataSource: LoginRemoteDataSourceImpl()),
  );

  getIt.registerSingleton<CoursesRepository>(CoursesRepository(
      coursesDataSource: CoursesRemoteDataSourceImpl(),
      coursesLocalDataSource: CoursesLocalDataSourceImpl()));

  getIt.registerSingleton<QuizUseCase>(QuizUseCase
    (quizRepo: QuizRepository(quizDataSource: QuizzesRemoteDataSourceImpl())));

  getIt.registerSingleton<FetchQuizDataUseCase>(FetchQuizDataUseCase
    (quizDataRepo: QuizDataRepository(quizDataSource: QuizDataRemoteDataSourceImpl())));

  getIt.registerSingleton<SubmitQuizUseCase>(SubmitQuizUseCase
    (quizDataRepo: QuizDataRepository(quizDataSource: QuizDataRemoteDataSourceImpl())));

    getIt.registerSingleton<MaterialFilesRepository >(MaterialFilesRepository
    (filesDataSource: MaterialFileRemoteDataSourceImpl(), fileLocalDataSource: MaterialFileLocalDataSourceImpl(),));

   getIt.registerSingleton<MaterialUsecase>(MaterialUsecase
    (materialRepo: MaterialRepository(materialDataSource: MaterialRemoteDatasourceImpl())));

    getIt.registerSingleton<MaterialFilesUseCase>(MaterialFilesUseCase
    ( filesRepo: MaterialFilesRepository(filesDataSource: MaterialFileRemoteDataSourceImpl(), 
    fileLocalDataSource: MaterialFileLocalDataSourceImpl())));
    
     getIt.registerSingleton<GetCalendarDayEventsUseCase>(GetCalendarDayEventsUseCase
    (CalendarRepositoryImpl(calenderRemoteDataSourceImpl: CalenderRemoteDataSourceImpl())));

   getIt.registerSingleton<AddEventToCalendarUseCase>(AddEventToCalendarUseCase
    (CalendarRepositoryImpl(calenderRemoteDataSourceImpl: CalenderRemoteDataSourceImpl())));

  getIt.registerSingleton<AssignmentRepo>(
    AssignmentRepoImpl(
      assignmentRemoteDataSource: AssignmentRemoteDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<GradeRepo>(
    GradeRepoImpl(
       gradeRemoteDataSource: GradeRemoteDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<NewsRepo>(
    NewsRepoImpl(
      newsRemoteDataSource: NewsRemoteDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<UserRepo>(
    UserRepoImpl(
      userRemoteDataSource: UserRemoteDataSourceImpl(),
    ),
  );
}
