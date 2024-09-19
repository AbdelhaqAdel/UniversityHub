class Answers {
  String? id;
  String? text;
  String? createdAt;

  Answers({this.id, this.text, this.createdAt});

 factory Answers.fromJson(Map<String, dynamic> json) {
  return Answers(
    id : json['id'],
    text : json['text'],
    createdAt : json['createdAt'],
  );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['createdAt'] = createdAt;
    return data;
  }
}

