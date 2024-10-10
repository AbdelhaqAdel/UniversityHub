import 'package:hive/hive.dart';
import 'package:universityhup/features/history/data/models/history_model.dart';

class StuHistoryAdapter extends TypeAdapter<HistoryModel> {
  @override
  final int typeId = 7; // Unique identifier for this type adapter

  @override
  HistoryModel read(BinaryReader reader) {
    return HistoryModel(
      hiveIndex: reader.readInt(),
      materialName: reader.readString(),
      instructorName: reader.readString(),
      historyMessage: reader.readString(),
      historyTime: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, HistoryModel obj) {
    writer.writeInt(obj.hiveIndex ?? 0);
    writer.writeString(obj.materialName ?? '');
    writer.writeString(obj.instructorName ?? '');
    writer.writeString(obj.historyMessage ?? '');
   writer.writeString(obj.historyTime ?? '');
  }
}