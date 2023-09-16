import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/bloc/api/api_bloc.dart';
import 'package:infinite_list/screen//home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApiBloc(),
        ),
      ],
      child: const MaterialApp(
        title: 'app name',
        home: HomeScreen(),
      ),
    );
  }
}
