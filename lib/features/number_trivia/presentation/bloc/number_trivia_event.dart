import 'package:equatable/equatable.dart';

abstract class NumberTriviaEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTriviaForConcreteNumber  extends NumberTriviaEvent {
  final String concreteNumber;

  GetTriviaForConcreteNumber(this.concreteNumber);
  @override
  List<Object> get props => [concreteNumber];
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {}