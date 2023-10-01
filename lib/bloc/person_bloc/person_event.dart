part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class PersonEventFetchData extends PersonEvent {
  @override
  List<Object?> get props => [];
}
