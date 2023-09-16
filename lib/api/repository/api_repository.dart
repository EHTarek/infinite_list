import 'package:infinite_list/api/provider/api_provider.dart';
import 'package:infinite_list/model/airline_data_model.dart';

class ApiRepository {
  Future<AirlineDataModel> fetchAirlineData(int page, int size) {
    return ApiProvider().getAirlineData(page, size);
  }
}
