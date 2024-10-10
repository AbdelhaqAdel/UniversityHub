import 'package:hive/hive.dart';

class HiveService {
  static void saveListOfType<ListType>(
      List<ListType> dataList, String boxName) {
    var box = Hive.box<ListType>(boxName);
    box.clear().then((v){
    box.addAll(dataList);
    });
  }

  static void save<entityType>(String key, value, String boxName) {
    var box = Hive.box<entityType>(boxName);
    box.put(key, value);
  }

  static void clear<ListType>(String boxName) {
    var box = Hive.box<List<ListType>>(boxName);
    box.clear();
  }

    static void saveMap<entityType>({required String key,required List<entityType> value,required String boxName}) {
    var box = Hive.box<List<entityType>>(boxName);
   box.delete(key).then((v){
    box.put(key, value);
   });

  }
  
  static List<entityType> fetchMap<entityType>({required String key, required String boxName}) {
  var box = Hive.box<List<entityType>>(boxName);
    var retrievedList = box.get(key, defaultValue: <entityType>[]) ?? [];
    return (retrievedList as List<dynamic>).map((item) => item as entityType).toList();
}




void storeItemsToHive<T>(String key, List<T> newItems, String boxName, T Function(int, T) createNewItem) {
  final Box box = Hive.box(boxName);

  List<T> itemsList = (box.get(key, defaultValue: []) as List).cast<T>();

  for (int i = 0; i < newItems.length; i++) {
    itemsList.add(createNewItem(itemsList.length, newItems[i]));
  }

  box.put(key, itemsList);
}


}

