
import 'answer_data_model.dart';

class Questions {
  String? id;
  String? text;
  String? type;
  int? questionNumber;
  int? grade;
  String? createdAt;
  List<Answers>? answers;

  Questions({
      required this.id,
      required this.text,
      required this.type,
      required this.questionNumber,
      required this.grade,
      required this.createdAt,
      required this.answers});

  factory Questions.fromJson(Map<String, dynamic> json) {
   return Questions(
      id : json['id'],
    text : json['text'],
    type : json['type'],
    questionNumber : json['questionNumber'],
    grade : json['grade'],
    createdAt : json['createdAt'],
    answers: json['answers'] != null
          ? (json['answers'] as List).map((v) => Answers.fromJson(v)).toList()
          : [],
   );
   
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

