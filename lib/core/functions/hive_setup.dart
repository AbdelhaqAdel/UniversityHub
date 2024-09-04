import 'package:hive_flutter/adapters.dart';

import '../constants/constant.dart';


Future<void> hiveSetup() async {
  await Hive.initFlutter();
  await Hive.openBox(kStartBox);

  var startBoxData = Hive.box(kStartBox);
  isOnboarding = startBoxData.get('isOnboarding') ?? false;


}