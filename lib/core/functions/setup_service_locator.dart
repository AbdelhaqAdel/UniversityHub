import 'package:get_it/get_it.dart';
import 'package:universityhup/features/calendar/data/data_sources/calender_remote_data_source.dart';
import 'package:universityhup/features/calendar/data/repositories/calender_repo_impl.dart';
import 'package:universityhup/features/calendar/domain/use_cases/add_to_calender_use_case.dart';
import 'package:universityhup/features/calendar/domain/use_cases/get_calender_use_case.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_local_data_source.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_remote_datasource.dart';
import 'package:universityhup/features/courses/data/repositories/courses_repo_impl.dart';
import 'package:universityhup/features/instructor_role/dashboard/data/data_sources/dashboard_remote_data_source.dart';
import 'package:universityhup/features/instructor_role/dashboard/data/repositories/dashboard_repo_impl.dart';
import 'package:universityhup/features/instructor_role/grade/data/data_sources/grade_remote_data_source.dart';
import 'package:universityhup/features/instructor_role/grade/data/repositories/grade_repo_impl.dart';
import 'package:universityhup/features/instructor_role/grade/domain/repositories/grade_repo.dart';
import 'package:universityhup/features/instructor_role/material/data/data_sources/material_remote_data_source.dart';
import 'package:universityhup/features/instructor_role/material/data/repositories/material_repo_impl.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/add_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/delete_material_use_case.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_files_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/material_usecase.dart';
import 'package:universityhup/features/instructor_role/material/domain/use_cases/update_material_use_case.dart';
import 'package:universityhup/features/instructor_role/quizzes/data/repositories/quiz_repo_impl.dart';
import 'package:universityhup/features/instructor_role/user/data/data_sources/user_local_data_source.dart';
import 'package:universityhup/features/news/data/data_sources/news_local_data_source.dart';
import 'package:universityhup/features/student_role/material/data/data_sources/material_file_local_data_source.dart';
import 'package:universityhup/features/student_role/quizzes/data/data_sources/quiz_data_remote_data_Source.dart';
import 'package:universityhup/features/student_role/quizzes/domain/use_cases/submit_quiz_usecase.dart';
import 'package:universityhup/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:universityhup/features/news/data/repositories/news_repo_impl.dart';
import '../../features/instructor_role/assignment/data/data_sources/assignment_remote_data_source.dart';
import '../../features/instructor_role/assignment/data/repositories/assignment_repo_impl.dart';
import '../../features/instructor_role/assignment/domain/repositories/assignment_repo.dart';
import '../../features/instructor_role/dashboard/domain/repositories/dashboard_repo.dart';
import '../../features/instructor_role/quizzes/data/data_sources/quiz_remote_data_source.dart';
import '../../features/instructor_role/quizzes/domain/repositories/quiz_repo.dart';
import '../../features/instructor_role/user/data/data_sources/user_remote_data_source.dart';
import '../../features/instructor_role/user/data/repositories/user_repo_impl.dart';
import '../../features/instructor_role/user/domain/repositories/user_repo.dart';
import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';
import '../../features/news/domain/repositories/news_repo.dart';
import '../../features/student_role/assignment/data/data_sources/assignment_remote_data_source.dart';
import '../../features/student_role/assignment/data/repositories/assignment_repo_impl.dart';
import '../../features/student_role/assignment/domain/repositories/assignment_repo.dart';
import '../../features/student_role/dashboard/data/data_sources/dashboard_remote_data_source.dart';
import '../../features/student_role/dashboard/data/repositories/dashboard_repo_impl.dart';
import '../../features/student_role/dashboard/domain/repositories/dashboard_repo.dart';
import '../../features/student_role/grade/data/data_sources/grade_remote_data_source.dart';
import '../../features/student_role/grade/data/repositories/grade_repo_impl.dart';
import '../../features/student_role/grade/domain/repositories/grade_repo.dart';
import '../../features/student_role/material/data/data_sources/material_file_remote_data_source.dart';
import '../../features/student_role/material/data/data_sources/material_remote_data_source.dart';
import '../../features/student_role/material/data/repositories/material_files_repo_impl.dart';
import '../../features/student_role/material/data/repositories/material_repo_impl.dart';
import '../../features/student_role/material/domain/use_cases/material_files_usecase.dart';
import '../../features/student_role/material/domain/use_cases/material_usecase.dart';
import '../../features/student_role/quizzes/data/data_sources/quiz_remote_data_source.dart';
import '../../features/student_role/quizzes/data/repositories/quiz_data_repo_impl.dart';
import '../../features/student_role/quizzes/data/repositories/quiz_repo_impl.dart';
import '../../features/student_role/quizzes/domain/use_cases/quiz_data_use_case.dart';
import '../../features/student_role/quizzes/domain/use_cases/quiz_use_case.dart';
import '../../features/student_role/user/data/data_sources/user_local_data_source.dart';
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

  getIt.registerSingleton<QuizUseCase>(QuizUseCase(
      quizRepo: QuizRepository(quizDataSource: QuizzesRemoteDataSourceImpl())));

  getIt.registerSingleton<FetchQuizDataUseCase>(FetchQuizDataUseCase(
      quizDataRepo:
          QuizDataRepository(quizDataSource: QuizDataRemoteDataSourceImpl())));

  getIt.registerSingleton<SubmitQuizUseCase>(SubmitQuizUseCase(
      quizDataRepo:
          QuizDataRepository(quizDataSource: QuizDataRemoteDataSourceImpl())));

  getIt.registerSingleton<MaterialFilesRepository>(MaterialFilesRepository(
    filesDataSource: MaterialFileRemoteDataSourceImpl(),
    fileLocalDataSource: MaterialFileLocalDataSourceImpl(),
  ));

  getIt.registerSingleton<MaterialUseCase>(MaterialUseCase(
      materialRepo: MaterialRepository(
          materialDataSource: MaterialRemoteDataSourceImpl())));

  getIt.registerSingleton<MaterialFilesUseCase>(MaterialFilesUseCase(
      filesRepo: MaterialFilesRepository(
          filesDataSource: MaterialFileRemoteDataSourceImpl(),
          fileLocalDataSource: MaterialFileLocalDataSourceImpl())));

  getIt.registerSingleton<GetCalendarDayEventsUseCase>(
      GetCalendarDayEventsUseCase(CalendarRepositoryImpl(
          calenderRemoteDataSourceImpl: CalenderRemoteDataSourceImpl())));

  getIt.registerSingleton<AddEventToCalendarUseCase>(AddEventToCalendarUseCase(
      CalendarRepositoryImpl(
          calenderRemoteDataSourceImpl: CalenderRemoteDataSourceImpl())));

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
      newsLocalDataSource: NewsLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<UserRepo>(
    UserRepoImpl(
      userRemoteDataSource: UserRemoteDataSourceImpl(), userStudentLocalDataSource: UserStudentLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<UserInstructorRepo>(
    UserInstructorRepoImpl(
      userRemoteDataSource: UserInstructorRemoteDataSourceImpl(), userInstructorLocalDataSource: UserInstructorLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<InsMaterialRepository>(InsMaterialRepository(
      materialDataSource: InsMaterialRemoteDataSourceImpl()));

  getIt.registerSingleton<InsMaterialUseCase>(
      InsMaterialUseCase(materialRepo: getIt.get<InsMaterialRepository>()));

  getIt.registerSingleton<InsMaterialFilesUseCase>(
      InsMaterialFilesUseCase(filesRepo: getIt.get<InsMaterialRepository>()));

  getIt.registerSingleton<UpdateMaterialUseCase>(
      UpdateMaterialUseCase(materialRepo: getIt.get<InsMaterialRepository>()));

  getIt.registerSingleton<DeleteMaterialUseCase>(
      DeleteMaterialUseCase(materialRepo: getIt.get<InsMaterialRepository>()));

  getIt.registerSingleton<AddMaterialUseCase>(
      AddMaterialUseCase(materialRepo: getIt.get<InsMaterialRepository>()));

  getIt.registerSingleton<AssignmentInstructorRepo>(
    AssignmentInstructorRepoImpl(
      assignmentRemoteDataSource: AssignmentInstructorRemoteDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<InsGradeRepo>(
    InsGradeRepoImpl(
      gradeRemoteDataSource: InsGradeRemoteDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<QuizInstructorRepo>(
    QuizInstructorRepoImpl(
      quizRemoteDataSource: QuizInstructorRemoteDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<DashboardRepo>(
    DashboardRepoImpl(
       dashboardRemoteDataSource: DashboardRemoteDataSourceImpl(),
    ) ,
  );
  getIt.registerSingleton<DashboardInstructorRepo>(
    DashboardInstructorRepoImpl(
      dashboardRemoteDataSource: DashboardInstructorRemoteDataSourceImpl(),
    ) ,
  );
}
