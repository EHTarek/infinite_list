import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/bloc/person_bloc/person_bloc.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  void initState() {
    context.read<PersonBloc>().add(PersonEventFetchData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, personState) {
          if (personState is PersonDataLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(),
                Text('Name = ${personState.person.name}'),
                Text('Age = ${personState.person.age}'),
              ],
            );
          }
          return const Center(child: Text('Empty'));
        },
      ),
    );
  }
}
