import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/bloc/api/api_bloc.dart';
import 'package:infinite_list/bloc/person_bloc/person_bloc.dart';
import 'package:infinite_list/screen/di_data_pass/screen_one.dart';
import 'injection_container.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApiBloc(),
        ),
        BlocProvider(
          lazy: false,
          // create: (context) => PersonBloc(data: sl()),
          create: (context) => sl<PersonBloc>(),
        ),
      ],
      child: const MaterialApp(
        title: 'app name',
        // home: HomeScreen(),
        home: ScreenOne(),
      ),
    );
  }
}
