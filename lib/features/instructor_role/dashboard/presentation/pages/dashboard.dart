



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/features/instructor_role/dashboard/domain/use_cases/get_dashboard_usecase.dart';
import 'package:universityhup/features/instructor_role/dashboard/presentation/manager/dashboard_cubit.dart';
import 'package:universityhup/features/instructor_role/dashboard/presentation/widgets/dashboard_body.dart';

import '../../../../../core/functions/setup_service_locator.dart';
import '../../domain/repositories/dashboard_repo.dart';

class DashboardInstructorScreen extends StatefulWidget {
  const DashboardInstructorScreen({super.key});

  @override
  State<DashboardInstructorScreen> createState() => _DashboardInstructorScreenState();
}

class _DashboardInstructorScreenState extends State<DashboardInstructorScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DashboardInstructorCubit(
              getDashboardInstructorUseCase: GetDashboardInstructorUseCase(
                dashboardRepo: getIt.get<DashboardInstructorRepo>(),
              ))..getDashboardInstructor(),
      child: const DashboardInstructorBody(),
    );
  }
}
