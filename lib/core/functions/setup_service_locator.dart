import 'package:get_it/get_it.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_local_datasource.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_remote_datasource.dart';
import 'package:universityhup/features/courses/data/repositories/courses_repo_impl.dart';
import 'package:universityhup/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:universityhup/features/news/data/repositories/news_repo_impl.dart';
import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';
import '../../features/news/domain/repositories/news_repo.dart';
import '../../features/student_role/assignment/data/data_sources/assignment_remote_data_source.dart';
import '../../features/student_role/assignment/data/repositories/assignment_repo_impl.dart';
import '../../features/student_role/assignment/domain/repositories/assignment_repo.dart';
import '../../features/student_role/assignment/domain/use_cases/get_assignment_usecase.dart';
import '../../features/student_role/grade/data/data_sources/grade_remote_data_source.dart';
import '../../features/student_role/grade/data/repositories/grade_repo_impl.dart';
import '../../features/student_role/grade/domain/repositories/grade_repo.dart';
import '../../features/student_role/material/data/data_sources/material_file_remote_datasource.dart';
import '../../features/student_role/material/data/data_sources/material_remote_datasource.dart';
import '../../features/student_role/material/data/repositories/material_files_repo_impl.dart';
import '../../features/student_role/material/data/repositories/material_repo_impl.dart';
import '../../features/student_role/material/domain/use_cases/material_files_usecase.dart';
import '../../features/student_role/material/domain/use_cases/material_usecase.dart';
import '../../features/student_role/quizzes/data/data_sources/quiz_data_remote_datasource.dart';
import '../../features/student_role/quizzes/data/data_sources/quiz_remote_datasource.dart';
import '../../features/student_role/quizzes/data/repositories/quiz_data_repo_impl.dart';
import '../../features/student_role/quizzes/data/repositories/quiz_repo_impl.dart';
import '../../features/student_role/quizzes/domain/use_cases/quiz_data_usecase.dart';
import '../../features/student_role/quizzes/domain/use_cases/quiz_usecase.dart';
import '../../features/student_role/user/data/data_sources/user_remote_data_source.dart';
import '../../features/student_role/user/data/repositories/user_repo_impl.dart';
import '../../features/student_role/user/domain/repositories/user_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(loginRemoteDataSource: LoginRemoteDataSourceImpl()),
  );

  getIt.registerSingleton<CoursesRepository>(CoursesRepository(
      coursesDataSource: CoursesRemoteDatasourceImpl(),
      coursesLocalDatasource: CoursesLocalDatasourceImpl()));

  getIt.registerSingleton<QuizUsecase>(QuizUsecase
    (quizRepo: QuizRepository(quizDataSource: QuizzesRemoteDatasourceImpl())));

  getIt.registerSingleton<QuizDataUsecase>(QuizDataUsecase
    (quizDataRepo: QuizDataRepository(quizDataSource: QuizDataRemoteDatasourceImpl())));

   getIt.registerSingleton<MaterialUsecase>(MaterialUsecase
    (materialRepo: MaterialRepository(materialDataSource: MaterialRemoteDatasourceImpl())));

    getIt.registerSingleton<MaterialFilesUsecase>(MaterialFilesUsecase
    ( filesRepo: MaterialFilesRepository(filesDataSource: MaterialFileRemoteDatasourceImpl())));


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
