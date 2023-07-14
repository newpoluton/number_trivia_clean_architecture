import 'package:equatable/equatable.dart';
import 'package:number_trivia_clean_architecture/features/number_trivia/domain/enteties/number_trivia_entity.dart';

abstract class NumberTriviaState extends Equatable{
  @override
  List<Object> get props =>[];
}

class Empty extends NumberTriviaState{}
class Loading extends NumberTriviaState{}
class Loaded extends NumberTriviaState{

  final NumberTriviaEntity trivia;

  Loaded(this.trivia);
  @override
  List<Object> get props => [trivia];
}
class Error extends NumberTriviaState{
  final String error;

  Error(this.error);
  @override
  List<Object> get props => [error];
}