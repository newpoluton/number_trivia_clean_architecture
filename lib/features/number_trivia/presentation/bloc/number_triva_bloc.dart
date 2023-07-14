import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_clean_architecture/core/constants/bloc_constants.dart';
import 'package:number_trivia_clean_architecture/core/error/failures.dart';

import '../../../../core/utils/input_converter.dart';
import '../../domain/enteties/number_trivia_entity.dart';
import '../../domain/usecases/get_concrete_number_trivia.dart';
import '../../domain/usecases/get_random_number_trivia.dart';
import 'number_trivia_event.dart';
import 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc(
      {required this.getConcreteNumberTrivia,
      required this.getRandomNumberTrivia,
      required this.inputConverter})
      : super(Empty()) {
    on<GetTriviaForConcreteNumber>(_onGetTriviaForConcreteNumber);
    on<GetTriviaForRandomNumber>(_onGetTriviaForRandomNumber);
  }

  void _onGetTriviaForConcreteNumber(
      GetTriviaForConcreteNumber event, Emitter<NumberTriviaState> emit) async {
    final inputEither =
        inputConverter.stringToUnsignedInteger(event.concreteNumber);
    await inputEither.fold((failure) {
      emit(Error(BlocConstants.invalidInputFailureMessage));
    }, (integer) async {
      emit(Loading());
      final failureOrTrivia = await getConcreteNumberTrivia(Param(integer));
      _eitherLoadedOrErrorState(emit, failureOrTrivia);
    });
  }

  void _onGetTriviaForRandomNumber(
      GetTriviaForRandomNumber event, Emitter<NumberTriviaState> emit) async {
    emit(Loading());
    final failureOrTrivia = await getRandomNumberTrivia(NoParams());
    _eitherLoadedOrErrorState(emit, failureOrTrivia);
  }

  void _eitherLoadedOrErrorState(Emitter<NumberTriviaState> emit,
      Either<Failure, NumberTriviaEntity> failureOrTrivia) async {
    failureOrTrivia.fold((failure) => emit(Error(_mapFailureToString(failure))),
        (trivia) => emit(Loaded(trivia)));
  }

  String _mapFailureToString(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return BlocConstants.serverFailureMessage;
      case CacheFailure:
        return BlocConstants.cacheFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
