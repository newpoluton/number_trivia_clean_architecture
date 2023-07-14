import 'package:flutter/material.dart';
import 'package:number_trivia_clean_architecture/injection_container.dart' as di;

import 'features/number_trivia/presentation/pages/number_trivia_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      home: const NumberTriviaPage(),
    );
  }
}

