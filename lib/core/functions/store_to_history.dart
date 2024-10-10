import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:universityhup/core/constants/hive_constants.dart';
import 'package:universityhup/features/history/data/models/history_model.dart';

class StoryServices{
  
 static final Box stuHistoryBox = Hive.box(HiveConstants.kStuHistory);

 static void stuStoreHistoryToHive({
    required String materialName,
    required String historyMessage,
    String? instructorName,
  }) {
    List<HistoryModel> stuHistoryList =
    stuHistoryBox.get(HiveConstants.kStuHistory, defaultValue: []).cast<HistoryModel>();
    stuHistoryList.add(
        HistoryModel(
          hiveIndex: stuHistoryList.length,
          materialName: materialName,
          historyMessage: historyMessage,
          instructorName: instructorName,
          historyTime:DateFormat("yyyy-MM-dd 'at' HH:mm").format(DateTime.now())
        ));
    stuHistoryBox.put(HiveConstants.kStuHistory, stuHistoryList);
  }

 static final Box insHistoryBox = Hive.box(HiveConstants.kInsHistory);

 static void insStoreHistoryToHive({
    required String materialName,
    required String historyMessage,
    String? instructorName,
  }) {
    List<HistoryModel> insHistoryList =
    insHistoryBox.get(HiveConstants.kInsHistory, defaultValue: []).cast<HistoryModel>();
    insHistoryList.add(
        HistoryModel(
          hiveIndex: insHistoryList.length,
          materialName: materialName,
          historyMessage: historyMessage,
          instructorName: instructorName,
          historyTime:DateFormat("yyyy-MM-dd 'at' HH:mm").format(DateTime.now())
        ));
    insHistoryBox.put(HiveConstants.kInsHistory, insHistoryList);
  }




}