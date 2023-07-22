import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_example/presentation/bloc/bloc/home_bloc.dart';
import 'package:flutter_bloc_clean_architecture_example/presentation/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'data/repositories/quotes_repository.dart';
import 'domain/usecases/get_random_quotes_usecase.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          getRandomQuotesUseCase: GetRandomQuotesUseCase(
              quotesRepositoryImp: QuotesRepositoryImp(http.Client())))
        ..add(GetRandomQuotesEvent()),
      child: MaterialApp(
          title: 'Flutter Bloc Clean Architecture Example',
          theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
          darkTheme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.teal,
              brightness: Brightness.dark),
          themeMode: ThemeMode.dark,
          home: const HomePage()),
    );
  }
}
