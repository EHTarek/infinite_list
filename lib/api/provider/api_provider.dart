import 'package:http/http.dart' as http;
import 'package:infinite_list/model/airline_data_model.dart';
import 'dart:convert';

class ApiProvider {
  Future<AirlineDataModel> getAirlineData(int page, int size) async {
    try {
      Uri url = Uri.parse(
          'https://api.instantwebtools.net/v1/passenger?page=$page&size=$size');
      http.Response response = await http.get(
        url,
        headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
      );

      return AirlineDataModel.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");

      return AirlineDataModel(totalPages: 0, totalPassengers: 0, data: []);
    }
  }
}
