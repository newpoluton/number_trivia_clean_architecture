import 'package:dartz/dartz.dart';
import 'package:number_trivia_clean_architecture/core/usecases/usecase.dart';
import 'package:number_trivia_clean_architecture/features/number_trivia/domain/enteties/number_trivia_entity.dart';

import '../../../../core/error/failures.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTriviaEntity, Param> {
  final NumberTriviaRepository numberTriviaRepositories;

  GetConcreteNumberTrivia(this.numberTriviaRepositories);

  @override
  Future<Either<Failure, NumberTriviaEntity>> call(Param param) async =>
  await numberTriviaRepositories.getConcreteNumberTrivia(param.num);
}

class Param {
  final int num;

  Param(this.num);
}
