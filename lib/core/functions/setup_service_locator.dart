import 'package:get_it/get_it.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_local_datasource.dart';
import 'package:universityhup/features/courses/data/data_sources/courses_remote_datasource.dart';
import 'package:universityhup/features/courses/data/repositories/courses_repo_impl.dart';

import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';
import '../../features/student_role/assignment/data/data_sources/assignment_remote_data_source.dart';
import '../../features/student_role/assignment/data/repositories/assignment_repo_impl.dart';
import '../../features/student_role/assignment/domain/repositories/assignment_repo.dart';
import '../../features/student_role/assignment/domain/use_cases/get_assignment_usecase.dart';
import '../../features/student_role/grade/data/data_sources/grade_remote_data_source.dart';
import '../../features/student_role/grade/data/repositories/grade_repo_impl.dart';
import '../../features/student_role/grade/domain/repositories/grade_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(loginRemoteDataSource: LoginRemoteDataSourceImpl()),
  );

  getIt.registerSingleton<CoursesRepository>(CoursesRepository(
      coursesDataSource: CoursesRemoteDatasourceImpl(),
      coursesLocalDatasource: CoursesLocalDatasourceImpl()));

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
}
