import 'package:flutter/material.dart';
import 'package:number_trivia_clean_architecture/features/number_trivia/domain/enteties/number_trivia_entity.dart';

class DisplayTrivia extends StatelessWidget {
  final NumberTriviaEntity numberTrivia;

  const DisplayTrivia({
    super.key,
    required this.numberTrivia,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            numberTrivia.number.toString(),
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  numberTrivia.text,
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
