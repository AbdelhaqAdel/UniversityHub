class GetCourseGradesModel {
  String? title;
  int? studentGrade;
  int? fullGrade;
  String? date;

  GetCourseGradesModel({this.title, this.studentGrade,this.fullGrade, this.date});

  GetCourseGradesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    studentGrade = json['studentGrade'];
    studentGrade = json['fullGrade'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['studentGrade'] = this.studentGrade;
    data['fullGrade'] = this.fullGrade;
    data['date'] = this.date;
    return data;
  }
}