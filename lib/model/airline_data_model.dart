import 'dart:convert';

import 'package:infinite_list/model/DataResultModel.dart';

AirlineDataModel airlineDataModelFromJson(String str) =>
    AirlineDataModel.fromJson(json.decode(str));

String airlineDataModelToJson(AirlineDataModel data) =>
    json.encode(data.toJson());

class AirlineDataModel {
  final int totalPassengers;
  final int totalPages;
  // final List<Datum> data;
  final List<DataResultModel> data;

  AirlineDataModel({
    required this.totalPassengers,
    required this.totalPages,
    required this.data,
  });

  factory AirlineDataModel.fromJson(Map<String, dynamic> json) =>
      AirlineDataModel(
        totalPassengers: json["totalPassengers"] ?? 0,
        totalPages: json["totalPages"] ?? 0,
        // data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        data: List<DataResultModel>.from(json["data"].map((x) => DataResultModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers,
        "totalPages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

// class Datum {
//   final String id;
//   final String name;
//   final int trips;
//   final List<Airline> airline;
//   final int v;
//
//   Datum({
//     required this.id,
//     required this.name,
//     required this.trips,
//     required this.airline,
//     required this.v,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["_id"] ?? '',
//         name: json["name"] ?? '',
//         trips: json["trips"] ?? '',
//         airline:
//             List<Airline>.from(json["airline"].map((x) => Airline.fromJson(x))),
//         v: json["__v"] ?? '',
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "trips": trips,
//         "airline": List<dynamic>.from(airline.map((x) => x.toJson())),
//         "__v": v,
//       };
// }

class Airline {
  final String id;
  final int airlineId;
  final String name;
  final String country;
  final String logo;
  final String slogan;
  final String headQuaters;
  final String website;
  final String established;
  final int v;

  Airline({
    required this.id,
    required this.airlineId,
    required this.name,
    required this.country,
    required this.logo,
    required this.slogan,
    required this.headQuaters,
    required this.website,
    required this.established,
    required this.v,
  });

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: json["_id"] ?? '',
        airlineId: json["id"] ?? 0,
        name: json["name"] ?? '',
        country: json["country"] ?? '',
        logo: json["logo"] ?? '',
        slogan: json["slogan"] ?? '',
        headQuaters: json["head_quaters"] ?? '',
        website: json["website"] ?? '',
        established: json["established"] ?? '',
        v: json["__v"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": airlineId,
        "name": name,
        "country": country,
        "logo": logo,
        "slogan": slogan,
        "head_quaters": headQuaters,
        "website": website,
        "established": established,
        "__v": v,
      };
}
