
import 'package:flutter/material.dart';

import '../../features/login/domain/entities/login_entity.dart';
import '../../features/student_role/user/domain/entities/user_entity.dart';


bool? isOnboarding;
bool? isLogin;

String? token;
String? currentCycleId;
String? currentCycleName;
String? role;

String? startDate;
String? endDate;

UserEntity? userEntity ;

LoginEntity? loginEntity;





var layoutScaffoldKey=GlobalKey<ScaffoldState>();

