import 'package:hive/hive.dart';
part 'all_courses_model.g.dart';

@HiveType(typeId: 0)
class CoursesModel {
  @HiveField(0)
  final int? hiveIndex;
   @HiveField(1)
  final String cycleId;
   @HiveField(2)
  final String name;
   @HiveField(3)
  final int hours;
   @HiveField(4)
  final String imagePath;
    @HiveField(5)
  final String instructorFullName;

  CoursesModel(
      {
      this.hiveIndex,
      required this.cycleId,
      required this.name,
      required this.hours,
      required this.imagePath,
      required this.instructorFullName});

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
    cycleId : json['cycleId'],
    name : json['name'],
    hours : json['hours'],
    imagePath : json['imagePath'],
    instructorFullName : json['instructorFullName'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cycleId'] = cycleId;
    data['name'] = name;
    data['hours'] =hours;
    data['imagePath'] = imagePath;
    data['instructorFullName'] =instructorFullName;
    return data;
  }
}