class Answers {
  String? id;
  String? text;
  String? createdAt;

  Answers({this.id, this.text, this.createdAt});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

