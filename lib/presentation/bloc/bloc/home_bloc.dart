import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/quotes_entity.dart';

import '../../../domain/usecases/get_random_quotes_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRandomQuotesUseCase getRandomQuotesUseCase;
  HomeBloc({required this.getRandomQuotesUseCase}) : super(HomeInitial()) {
    on<GetRandomQuotesEvent>(_getRandomQuotesEventHandler);
  }

  _getRandomQuotesEventHandler(
      GetRandomQuotesEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      List<QuotesEntity> entity =
          await getRandomQuotesUseCase.getRandomQuotes();
      emit(HomeSuccess(data: entity));
    } catch (e) {
      emit(HomeError(textError: e.toString()));
    }
  }
}
