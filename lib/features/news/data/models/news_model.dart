
import '../../domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {

  NewsModel({required super.newsId, required super.content, required super.filePath, required super.facultyId, required super.createdAt, required super.userId, required super.userName, required super.userImage, required super.facultyName});
  factory NewsModel.fromJson(Map<String, dynamic> json) =>NewsModel(
    newsId : json['newsId'],
    content : json['content'],
    filePath : json['filePath'],
    facultyId : json['facultyId'],
    createdAt : json['createdAt'],
    userId : json['userId'],
    userName:json['userName']??json['user'],
    userImage:json['userImage'],
    facultyName:json['facultyName'],
    );

}
