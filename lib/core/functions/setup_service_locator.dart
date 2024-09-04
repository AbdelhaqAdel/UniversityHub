import 'package:get_it/get_it.dart';
import 'package:universityhup/features/AllCourses/data/data_sources/courses_remote_datasource.dart';
import 'package:universityhup/features/AllCourses/data/repositories/courses_repo_impl.dart';

import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';
final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(loginRemoteDataSource: LoginRemoteDataSourceImpl()),
  );

  getIt.registerSingleton<CoursesRepository>(CoursesRepository
    (coursesDataSource: CoursesRemoteDatasourceImpl()));

}
