import 'package:bloc/bloc.dart';
import '../../domain/use_cases/get_news_usecase.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(
      {required this.getNewsUseCase})
      : super(NewsInitial());

  final GetNewsUseCase getNewsUseCase;

  void getNews() async {
    emit(GetNewsLoadingState());
    var result = await getNewsUseCase.call();
    result.fold((failure) {
      print(failure.message);
      emit(GetNewsErrorState(failure.toString()));
    }, (right) {
      emit(GetNewsSuccessState(newsEntity: right));
    });
  }



}

