import 'package:universityhup/features/student/quizzes/data/models/answer_data_model.dart';

class Questions {
  String? id;
  String? text;
  String? type;
  int? questionNumber;
  int? grade;
  String? createdAt;
  List<Answers>? answers;

  Questions(
      {this.id,
        this.text,
        this.type,
        this.questionNumber,
        this.grade,
        this.createdAt,
        this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    type = json['type'];
    questionNumber = json['questionNumber'];
    grade = json['grade'];
    createdAt = json['createdAt'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add( Answers.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['type'] = type;
    data['questionNumber'] = questionNumber;
    data['grade'] = grade;
    data['createdAt'] = createdAt;
    if (this.answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

