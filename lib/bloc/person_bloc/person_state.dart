part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();
}

class PersonInitial extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonDataLoaded extends PersonState {
  final PersonDataModel person;

  const PersonDataLoaded({required this.person});

  @override
  List<Object> get props => [];
}
