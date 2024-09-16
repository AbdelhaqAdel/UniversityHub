import 'package:dartz/dartz.dart';
import 'package:universityhup/core/errors/failure.dart';

import '../../data/models/question_data_model.dart';

abstract class QuizDataRepo{
 Future<Either<Failure, List<Questions>>>getQuizData();
}