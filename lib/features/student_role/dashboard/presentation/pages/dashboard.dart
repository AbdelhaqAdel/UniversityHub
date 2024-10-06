import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/setup_service_locator.dart';
import '../../domain/repositories/dashboard_repo.dart';
import '../../domain/use_cases/get_dashboard_usecase.dart';
import '../manager/dashboard_cubit.dart';
import '../widgets/dashboard_body.dart';



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DashboardCubit(
              getDashboardUseCase: GetDashboardUseCase(
                dashboardRepo: getIt.get<DashboardRepo>(),
              ))..getDashboard(),
      child: const DashboardBody(),
    );
  }
}
