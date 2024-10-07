import 'package:hive/hive.dart';

part 'news_entity.g.dart';

@HiveType(typeId: 12)
class NewsEntity {
  @HiveField(0)
  final String? newsId;
  @HiveField(1)
  final String? content;
  @HiveField(2)
  final String? filePath;
  @HiveField(3)
  final String? facultyId;
  @HiveField(4)
  final String? createdAt;
  @HiveField(5)
  final String? userId;
  @HiveField(6)
  final String? userName;
  @HiveField(7)
  final String? userImage;
  @HiveField(8)
  final String? facultyName;

  NewsEntity(
      {required this.newsId,
      required this.content,
      required this.filePath,
      required this.facultyId,
      required this.createdAt,
      required this.userId,
      required this.userName,
      required this.userImage,
      required this.facultyName});
}
