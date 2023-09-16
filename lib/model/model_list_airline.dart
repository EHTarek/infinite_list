// Reference from:
// https://levelup.gitconnected.com/flutter-app-from-scratch-part-2-define-models-and-set-up-database-78a67666527a

import 'model_data_airline.dart';

class AirlineDataModelOld {
  int? totalPassengers;
  int? totalPages;
  List<Data>? data;

  AirlineDataModelOld({this.totalPassengers, this.totalPages, this.data});

  AirlineDataModelOld.fromJson(Map<String, dynamic> json) {
    totalPassengers = json['totalPassengers'];
    totalPages = json['totalPages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPassengers'] = totalPassengers;
    data['totalPages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}