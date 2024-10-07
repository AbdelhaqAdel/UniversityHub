import 'package:hive/hive.dart';

class HiveService {
  static void saveListOfType<ListType>(
      List<ListType> dataList, String boxName) {
    var box = Hive.box<ListType>(boxName);
    box.addAll(dataList);
  }

  static void save<entityType>(String key, value, String boxName) {
    var box = Hive.box<entityType>(boxName);
    box.put(key, value);
  }

  static void clear(String boxName) {
    var box = Hive.box(boxName);
    box.clear();
  }
}
