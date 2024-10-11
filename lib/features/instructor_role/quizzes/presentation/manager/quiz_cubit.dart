import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universityhup/core/functions/store_to_history.dart';
import 'package:universityhup/features/instructor_role/quizzes/presentation/manager/quiz_state.dart';
import '../../../../../core/functions/date_time_picker.dart';
import '../../data/models/add_quiz_input.dart';
import '../../domain/use_cases/add_quiz_usecase.dart';
import '../../domain/use_cases/delete_quiz_usecase.dart';
import '../../domain/use_cases/get_quiz_usecase.dart';

class QuizInstructorCubit extends Cubit<QuizInstructorState> {
  QuizInstructorCubit(
      {required this.getQuizInstructorUseCase,
      required this.addQuizUseCase,
      required this.deleteQuizUseCase})
      : super(QuizInstructorInitial());

  static QuizInstructorCubit get(context) => BlocProvider.of(context);

  final GetQuizInstructorUseCase getQuizInstructorUseCase;
  final DeleteQuizUseCase deleteQuizUseCase;
  final AddQuizUseCase addQuizUseCase;

  void getQuizInstructor() async {
    GetQuizInstructorSuccessState.completedQuizInstructorEntity = [];
    GetQuizInstructorSuccessState.pendingQuizInstructorEntity = [];
    emit(GetQuizInstructorLoadingState());

    var result = await getQuizInstructorUseCase.call();
    result.fold((failure) {
      emit(GetQuizInstructorErrorState(failure.toString()));
    }, (right) {
      GetQuizInstructorSuccessState.completedQuizInstructorEntity =
          right.quizEntityCompleteList;
      GetQuizInstructorSuccessState.pendingQuizInstructorEntity =
          right.quizEntityPendingList;

      emit(GetQuizInstructorSuccessState());
    });
  }

  void addQuiz() async {
    emit(AddQuizLoadingState());
    Map<String, dynamic> data = fetchQuizQuestion();
    addQuizInputModel = AddQuizInputModel.fromJson(data);
    var result = await addQuizUseCase.call(addQuizInputModel);
    result.fold((failure) {
      emit(AddQuizErrorState(failure.toString()));
    }, (right) {
      StoryServices.insStoreHistoryToHive(
          materialName: 'Quiz title: Quiz1', historyMessage: 'New quiz added');
      emit(AddQuizSuccessState());
      addQuizInputModel = AddQuizInputModel();
    });
  }

  void deleteQuiz({required String quizId}) async {
    emit(DeleteQuizLoadingState());
    var result = await deleteQuizUseCase.call(quizId);
    result.fold((failure) {
      emit(DeleteQuizErrorState(failure.toString()));
    }, (right) {
      getQuizInstructor();
      emit(DeleteQuizSuccessState());
    });
  }

  Future<String?> pickDateTime({required context}) async {
    String? dateTime = await dataTimePicker(context: context);
    emit(PickDateTime());
    return dateTime;
  }

  Map<String, dynamic> fetchQuizQuestion() {
    answerMap = [];
    questionMap = [];
    for (int i = 0; i < answerListController.length; i++) {
      answerMap.add([]);
      for (int j = 0; j < answerListController[i].length; j++) {
        if (answerListController[i][j].text != '') {
          answerMap[i].add({
            'text': answerListController[i][j].text,
            'isCorrect': answerCheck[i][j],
            'answerNumber': j
          });
        }
      }
    }

    for (int i = 0; i < questionListController.length; i++) {
      questionMap.add({
        "text": questionListController[i].text,
        "type": "choice",
        "questionNumber": i + 1,
        "grade": int.parse(gradeListController[i].text),
        "answers": answerMap[i],
      });
    }

    Map<String, dynamic> data = {
      "title": addQuizInputModel!.title,
      "notes": addQuizInputModel!.notes,
      "startDate": addQuizInputModel!.startDate,
      "endDate": addQuizInputModel!.endDate,
      "grade": addQuizInputModel!.grade,
      "courseCycleId": addQuizInputModel!.courseCycleId,
      "questions": questionMap,
    };
    return data;
  }

  static AddQuizInputModel? addQuizInputModel = AddQuizInputModel();
  List<Map<String, dynamic>> questionMap = [];
  List<List<Map<String, dynamic>>> answerMap = [];
  List<TextEditingController> questionListController = [
    TextEditingController()
  ];
  List<TextEditingController> gradeListController = [TextEditingController()];
  List<List<TextEditingController>> answerListController = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]
  ];
  List<List<bool>> answerCheck = [
    [
      true,
      false,
      false,
      false,
    ]
  ];
  int questionActionIndex = 0;

  setQuestionActionIndex({required int actionIndex}) {
    questionActionIndex = actionIndex;
    emit(QuestionActionState());
  }

  void setAnswerCheck(index, index2) {
    answerCheck[index] = [false, false, false, false];
    answerCheck[index].removeAt(index2);
    answerCheck[index].insert(index2, true);
    emit(CheckState());
  }
}
