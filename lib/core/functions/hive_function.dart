
import 'package:hive/hive.dart';

void save(String key, value,String boxName) {
  var box = Hive.box(boxName);
  box.put(key,value);
}



void clear(String boxName) {
  var box = Hive.box(boxName);
  box.clear();
}


