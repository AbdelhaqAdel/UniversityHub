class QuizEntity {
  String? id;
  String? title;
  String? notes;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? status;

  QuizEntity(
      { 
      required this.id,
      required this.title,
      required this.notes,
      required this.startDate,
      required this.endDate,
      required this.createdAt,
      required this.status,
      });
}