import 'package:get_it/get_it.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_local_datasource.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_remote_datasource.dart';
import 'package:universityhup/features/courses/data/repositories/courses_repo_impl.dart';
import 'package:universityhup/features/student/material/data/data_sources/material_remote_datasource.dart';
import 'package:universityhup/features/student/material/data/repositories/material_repo_impl.dart';
import 'package:universityhup/features/student/material/domain/use_cases/material_usecase.dart';
import 'package:universityhup/features/student/quizzes/data/data_sources/quiz_data_remote_datasource.dart';
import 'package:universityhup/features/student/quizzes/data/data_sources/quiz_remote_datasource.dart';
import 'package:universityhup/features/student/quizzes/data/repositories/quiz_data_repo_impl.dart';
import 'package:universityhup/features/student/quizzes/data/repositories/quiz_repo_impl.dart';
import 'package:universityhup/features/student/quizzes/domain/use_cases/quiz_data_usecase.dart';
import 'package:universityhup/features/student/quizzes/domain/use_cases/quiz_usecase.dart';

import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';
final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(loginRemoteDataSource: LoginRemoteDataSourceImpl()),
  );

  getIt.registerSingleton<CoursesRepository>(CoursesRepository
    (coursesDataSource: CoursesRemoteDatasourceImpl(),coursesLocalDatasource: CoursesLocalDatasourceImpl()));

  getIt.registerSingleton<QuizUsecase>(QuizUsecase
    (quizRepo: QuizRepository(quizDataSource: QuizzesRemoteDatasourceImpl())));

  getIt.registerSingleton<QuizDataUsecase>(QuizDataUsecase
    (quizDataRepo: QuizDataRepository(quizDataSource: QuizDataRemoteDatasourceImpl())));

   getIt.registerSingleton<MaterialUsecase>(MaterialUsecase
    (materialRepo: MaterialRepository(materialDataSource: MaterialRemoteDatasourceImpl())));


}
