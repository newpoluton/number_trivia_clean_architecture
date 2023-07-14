import '../../domain/enteties/number_trivia_entity.dart';

class NumberTriviaModel extends NumberTriviaEntity {
  const NumberTriviaModel({required super.number, required super.text});

  factory NumberTriviaModel.fromJson(Map json) => NumberTriviaModel(
        number: (json['number'] as num).toInt(),
        text: json['text'],
      );

  Map toJson() => {
        'text': text,
        'number': number,
      };

  @override
  List<Object> get props => [text, number];
}
