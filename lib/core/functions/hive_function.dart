import 'package:hive/hive.dart';

class HiveService{
static void save(String key, value,String boxName) {
  var box = Hive.box(boxName);
  box.put(key,value);
}

static void clear(String boxName) {
  var box = Hive.box(boxName);
  box.clear();
}

}