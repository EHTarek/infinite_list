import 'package:infinite_list/api/repository/api_repository.dart';
import 'package:infinite_list/bloc/api/api_event.dart';
import 'package:infinite_list/bloc/api/api_state.dart';
import 'package:bloc/bloc.dart';
import 'package:infinite_list/model/airline_data_model.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiStateInitial()) {
    on<ApiEventGetAirlineList>(_onApiEventGetAirlineList);
  }

  _onApiEventGetAirlineList(
      ApiEventGetAirlineList event, Emitter<ApiState> emit) async {
    final ApiRepository apiRepository = ApiRepository();
    try {
      AirlineDataModel mList =
          await apiRepository.fetchAirlineData(event.page, event.size);

      if (mList.totalPages != 0 && mList.totalPassengers != 0) {
        emit(ApiStateLoaded(mList));
      } else {
        emit(ApiStateError(404, "Failed to fetch data. data is not found"));
      }
    } on Exception catch (e) {
      emit(ApiStateError(500,
          "${e.toString()} . Failed to fetch data. is your device online?"));
    }
  }
}
