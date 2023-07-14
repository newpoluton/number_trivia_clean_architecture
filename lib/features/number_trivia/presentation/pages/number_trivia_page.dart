import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_clean_architecture/features/number_trivia/presentation/widgets/display_trivia.dart';
import 'package:number_trivia_clean_architecture/features/number_trivia/presentation/widgets/loading_widget.dart';
import 'package:number_trivia_clean_architecture/features/number_trivia/presentation/widgets/message_display.dart';
import 'package:number_trivia_clean_architecture/features/number_trivia/presentation/widgets/trivia_controls.dart';

import '../../../../injection_container.dart';
import '../bloc/number_triva_bloc.dart';
import '../bloc/number_trivia_state.dart';

class NumberTriviaPage extends StatefulWidget {
  const NumberTriviaPage({super.key});

  @override
  State<NumberTriviaPage> createState() => _NumberTriviaPageState();
}

class _NumberTriviaPageState extends State<NumberTriviaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
      body: SingleChildScrollView(child: BlocProvider(
        create: (_) => sl<NumberTriviaBloc>(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                BlocBuilder<NumberTriviaBloc, NumberTriviaState>(builder: (context, state) {
                  if(state is Empty) {
                    return const MessageDisplay(message: 'Start searching!');
                  }
                  else if (state is Loading){
                    return const LoadingWidget();
                  }
                  else if(state is Loaded){
                    return DisplayTrivia(numberTrivia: state.trivia);
                  }
                  else if (state is Error) {
                    return MessageDisplay(message: state.error);
                  }
                  return const SizedBox();
                }),
                const SizedBox(height:20),
                const TriviaControls(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(builder: (context, state) {
                if(state is Empty) {
                  const MessageDisplay(message: 'Start searching!');
                }
                else if (state is Loading){
                  return const LoadingWidget();
                }
                else if(state is Loaded){
                  return DisplayTrivia(numberTrivia: state.trivia);
                }
                else if (state is Error) {
                  return MessageDisplay(message: state.error);
                }
                return const SizedBox();
              }),
              const SizedBox(height:20),
              const TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}
