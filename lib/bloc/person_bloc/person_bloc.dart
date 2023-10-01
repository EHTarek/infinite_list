import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_list/api/provider/person_data.dart';
import 'package:infinite_list/model/person_data_model.dart';

part 'person_event.dart';

part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonData data;

  PersonBloc({required this.data}) : super(PersonInitial()) {
    on<PersonEventFetchData>((event, emit) {
      emit(PersonInitial());
      emit(PersonDataLoaded(person: data.getData()));
    });
  }
}
